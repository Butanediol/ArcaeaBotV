import Vapor
import Fluent
import telegram_vapor_bot

final class DefaultBotHandlers {

    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        startHandler(app: app, bot: bot)
        bindHandler(app: app, bot: bot)
        unbindHandler(app: app, bot: bot)
        recentHandler(app: app, bot: bot)
        myHandler(app: app, bot: bot)
        best30Handler(app: app, bot: bot)
    }

    private static func startHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/start"], botUsername: app.tgConfig?.botUsername) { update, bot in
            try update.message?.reply(text: "Hello telegram user.", bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func bindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/bind"], botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Check if already bound.
            if let relationship = try BindingRelationship.query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() {
                // Already bound
                let userInfo = try StoredUserInfo.query(on: app.db).filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode).first().wait()
                try update.message?.reply(text: "You have already bound, \(userInfo?.displayName ?? relationship.arcaeaFriendCode)", bot: bot)
            } else {
                // New user

                // Ensure friend code is valid
                guard 
                    let arcaeaFriendCode = update.message?.parameters.joined(separator: " ") as? ArcaeaFriendCode,
                    arcaeaFriendCode.isValid
                else {
                    try update.message?.reply(text: "Invalid arcaea friend code.", bot: bot)
                    return
                }

                let result = app.arcaeaLimitedAPI.userInfo(friendCode: arcaeaFriendCode)
                switch result {
                    case .success(let userInfo):
                        try userInfo.toStored(friendCode: arcaeaFriendCode).save(on: app.db).wait()
                        try BindingRelationship(telegramUserId: telegramUserId, arcaeaFriendCode: arcaeaFriendCode)
                            .save(on: app.db)
                            .wait()
                        try update.message?.reply(text: "Hello, \(userInfo.displayName)", bot: bot)

                    case .failure(let error):
                        try update.message?.reply(text: "\(error.errorDescription)".markdownV2Escaped, bot: bot, parseMode: .markdownV2)
                }
            }                
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func unbindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/unbind"], botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Check if already bound.
            if let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() {
                // Already bound
                let userInfo = try StoredUserInfo
                .query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .sort(\.$createdAt)
                .first()
                .wait()

                try relationship.delete(on: app.db).wait()
                try update.message?.reply(text: "Goodbye, \(userInfo?.displayName ?? relationship.arcaeaFriendCode).", bot: bot)
            } else {
                // Not bound

                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
            }
                
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func recentHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/recent"], botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() else {
                    try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                    return
                }

            let result = app.arcaeaLimitedAPI.userInfo(friendCode: relationship.arcaeaFriendCode)
            switch result {
                case .success(let userInfo):
                    try update.message?.reply(text: userInfo.formatted(app: app).markdownV2Escaped, bot: bot, parseMode: .markdownV2)
                    try userInfo.toStored(friendCode: relationship.arcaeaFriendCode).save(on: app.db).wait()

                case .failure(let error):
                    try update.message?.reply(text: "\(error.errorDescription)".markdownV2Escaped, bot: bot, parseMode: .markdownV2)
            }
        }
        bot.connection.dispatcher.add(handler)
    }


    private static func myHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/my"], options: [.editedUpdates], botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // TODO: - Refine search logic
            guard let parameters = update.message?.parameters else { app.logger.info("parameters error"); return }
            guard let searchText = parameters.first else { 
                try update.message?.reply(text: "Invalid song name.", bot: bot)
                return 
            }

            var difficulty: Difficulty = .future
            switch parameters.last {
                case "pst", "past":
                    difficulty = .past
                case "prs", "present":
                    difficulty = .present
                case "ftr", "future", "0":
                    difficulty = .future
                case "byd", "byn", "beyond":
                    difficulty = .beyond
                default:
                    break
            }

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() else {
                    try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                    return
                }

            guard let userInfo = try StoredUserInfo
                .query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .first()
                .wait() else {
                    throw Abort(.internalServerError)
                }


            if let alias = try Alias.query(on: app.db).filter(\.$alias, .equal, searchText).first().wait(),
                let song = try Song.query(on: app.db).filter(\.$sid, .equal, alias.sid).first().wait() {
                    // Search in aliases
                app.logger.info("Found song \(song.nameEn) in aliases.")
                let result = app.arcaeaLimitedAPI.scoreInfo(friendCode: relationship.arcaeaFriendCode, difficulty: difficulty, songId: song.sid)
                switch result {
                    case .success(let play):
                        try update.message?.reply(text: play.formatted(app: app, userInfo: userInfo).markdownV2Escaped, bot: bot, parseMode: .markdownV2)
                    case .failure(let error):
                        try update.message?.reply(text: "\(error.errorDescription)".markdownV2Escaped, bot: bot, parseMode: .markdownV2)
                }
            } else if let song = try Song.query(on: app.db).group(.or, { group in
                group.filter(\.$sid ~~ searchText)
                group.filter(\.$nameEn ~~ searchText)
                group.filter(\.$nameJp ~~ searchText)
            })
            .first().wait() {
                // Search by sid, nameEn, nameJp
                app.logger.info("Found song \(song.nameEn) by sid, nameEn, nameJP.")
                let result = app.arcaeaLimitedAPI.scoreInfo(friendCode: relationship.arcaeaFriendCode, difficulty: difficulty, songId: song.sid)
                switch result {
                    case .success(let play):
                        try update.message?.reply(text: play.formatted(app: app, userInfo: userInfo).markdownV2Escaped, bot: bot, parseMode: .markdownV2)
                    case .failure(let error):
                        try update.message?.reply(text: "\(error.errorDescription)".markdownV2Escaped, bot: bot, parseMode: .markdownV2)
                }
            } else {
                app.logger.info("Song not found.")
                try update.message?.reply(text: "Song \(searchText) not found.".markdownV2Escaped, bot: bot, parseMode: .markdownV2)
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func best30Handler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/best30"], botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() else {
                    try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                    return
                }

            let userInfo = try StoredUserInfo.query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .first()
                .wait()

            let result = app.arcaeaLimitedAPI.bestInfo(friendCode: relationship.arcaeaFriendCode)
            switch result {
                case .success(let best30):
                    try update.message?.reply(text: best30.formatted(app: app, userInfo: userInfo), bot: bot)
                case .failure(let error):
                    try update.message?.reply(text: "\(error.errorDescription)", bot: bot)
            }
        }
        bot.connection.dispatcher.add(handler)
    }
}