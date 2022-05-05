import Vapor
import telegram_vapor_bot

final class DefaultBotHandlers {

    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        startHandler(app: app, bot: bot)
        bindHandler(app: app, bot: bot)
        unbindHandler(app: app, bot: bot)
        recentHandler(app: app, bot: bot)
    }

    private static func startHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/start"]) { update, bot in
            try update.message?.reply(text: "Hello telegram user.", bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func bindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/bind"]) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Check if already bound.
            if let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() {
                // Already bound
                try update.message?.reply(text: "You have already bound, \(relationship.arcaeaFriendCode)", bot: bot)
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

                let userInfo = try app.arcaeaLimitedAPI.userInfo(friendCode: arcaeaFriendCode)

                try update.message?.reply(text: "Hello, \(userInfo.displayName)", bot: bot)

                try userInfo.toStored(friendCode: arcaeaFriendCode).save(on: app.db).wait()
                try BindingRelationship(telegramUserId: telegramUserId, arcaeaFriendCode: arcaeaFriendCode)
                    .save(on: app.db)
                    .wait()
            }
                
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func unbindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/unbind"]) { update, bot in

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
        let handler = TGCommandHandler(commands: ["/recent"]) { update, bot in

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

            let userInfo = try app.arcaeaLimitedAPI.userInfo(friendCode: relationship.arcaeaFriendCode)

            try update.message?.reply(text: userInfo.formatted(app: app).markdownV2Escaped, bot: bot, parseMode: .markdownV2)
            try userInfo.toStored(friendCode: relationship.arcaeaFriendCode).save(on: app.db).wait()
        }
        bot.connection.dispatcher.add(handler)
    }

}