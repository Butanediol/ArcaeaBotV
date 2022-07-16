import Fluent
import telegram_vapor_bot
import Vapor

enum DefaultBotHandlers {
    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        startHandler(app: app, bot: bot)
        bindHandler(app: app, bot: bot)
        unbindHandler(app: app, bot: bot)
        recentHandler(app: app, bot: bot)
        myHandler(app: app, bot: bot)
        best30Handler(app: app, bot: bot)
        getAliasHandler(app: app, bot: bot)
        getSongHandler(app: app, bot: bot)
        addAliasHandler(app: app, bot: bot)
        calHandler(app: app, bot: bot)
        statsHandler(app: app, bot: bot)
        opHandler(app: app, bot: bot)
        historyHandler(app: app, bot: bot)
    }

    private static func startHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/start"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            var markup: TGReplyMarkup? {
                if let webbAppBaseUrl = app.tgConfig?.webAppBaseUrl {
                    return .inlineKeyboardMarkup(.init(inlineKeyboard: [[.init(
                        text: "Web Application",
                        webApp: .init(url: webbAppBaseUrl)
                    )]]))
                } else { return nil }
            }

            try update.message?.reply(
                text: "Hello telegram user.",
                bot: bot,
                replyMarkup: markup
            )
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func bindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/bind"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id, telegramUserId != 136_817_688 else { return }

            // Check if already bound.
            if let relationship = try BindingRelationship.query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            {
                // Already bound
                let userInfo = try StoredUserInfo.query(on: app.db)
                    .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode).first().wait()
                try update.message?.reply(
                    text: "You have already bound, \(userInfo?.displayName ?? relationship.arcaeaFriendCode)",
                    bot: bot
                )
            } else {
                // New user

                // Ensure friend code is valid
                guard
                    let arcaeaFriendCode = update.message?.parameters
                    .joined(separator: " ") as? ArcaeaFriendCode,
                    arcaeaFriendCode.isValid
                else {
                    try update.message?.reply(text: "Invalid arcaea friend code.", bot: bot)
                    return
                }

                let result = app.arcaeaLimitedAPI.userInfo(friendCode: arcaeaFriendCode)
                switch result {
                case let .success(userInfo):
                    try BindingRelationship(
                        telegramUserId: telegramUserId,
                        arcaeaFriendCode: arcaeaFriendCode
                    )
                    .save(on: app.db)
                    .wait()
                    try update.message?.reply(text: "Hello, \(userInfo.displayName)", bot: bot)

                case let .failure(error):
                    try update.message?.reply(
                        text: "\(error.errorDescription ?? "Error description found.")".markdownV2Escaped,
                        bot: bot,
                        parseMode: .markdownV2
                    )
                }
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func unbindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/unbind"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Check if already bound.
            if let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            {
                // Already bound
                let userInfo = try StoredUserInfo
                    .query(on: app.db)
                    .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                    .sort(\.$createdAt)
                    .first()
                    .wait()

                try relationship.delete(on: app.db).wait()
                try update.message?.reply(
                    text: "Goodbye, \(userInfo?.displayName ?? relationship.arcaeaFriendCode).",
                    bot: bot
                )
            } else {
                // Not bound

                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func recentHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/recent"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            else {
                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                return
            }

            let result = app.arcaeaLimitedAPI.userInfo(friendCode: relationship.arcaeaFriendCode)
            switch result {
            case let .success(userInfo):
                try update.message?.reply(
                    text: userInfo.formatted(app: app).markdownV2Escaped,
                    bot: bot,
                    parseMode: .markdownV2,
                    replyMarkup: .inlineKeyboardMarkup(.init(inlineKeyboard: [[
                        CallbackDataEvent.my(
                            userInfo.lastPlayedSong.songID,
                            userInfo.lastPlayedSong.difficulty
                        ).button,
                        CallbackDataEvent.recent.button,
                    ]]))
                )

            case let .failure(error):
                try update.message?.reply(
                    text: "\(error.errorDescription ?? "Error description found.")".markdownV2Escaped,
                    bot: bot,
                    parseMode: .markdownV2
                )
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func myHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(
            commands: ["/my"],
            options: [.editedUpdates],
            botUsername: app.tgConfig?.botUsername
        ) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // TODO: - Refine search logic
            guard let parameters = update.message?.parameters
            else { app.logger.info("parameters error"); return }
            guard let searchText = parameters.first else {
                try update.message?.reply(text: "Invalid song name.", bot: bot)
                return
            }

            let difficulty: Difficulty = parameters.last?.toDifficulty() ?? .future

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            else {
                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                return
            }

            guard let userInfo = try StoredUserInfo
                .query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .sort(\.$createdAt, .descending)
                .first()
                .wait()
            else {
                throw Abort(.internalServerError)
            }

            guard let song = try Song.search(searchText, in: app, options: .includeAliases).wait().first
            else {
                try update.message?.reply(text: "There are no songs named \(searchText).", bot: bot)
                return
            }

            let result = app.arcaeaLimitedAPI.scoreInfo(
                friendCode: relationship.arcaeaFriendCode,
                difficulty: difficulty,
                songId: song.sid
            )
            switch result {
            case let .success(play):
                try update.message?.reply(
                    text: play.formatted(app: app, userInfo: userInfo).markdownV2Escaped,
                    bot: bot,
                    parseMode: .markdownV2,
                    replyMarkup: .inlineKeyboardMarkup(.init(inlineKeyboard: [[CallbackDataEvent
                            .my(play.songID, play.difficulty).button]]))
                )
            case let .failure(error):
                try update.message?.reply(
                    text: "\(error.errorDescription ?? "Error description found.")".markdownV2Escaped,
                    bot: bot,
                    parseMode: .markdownV2
                )
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func best30Handler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/best30"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            else {
                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                return
            }

            // Get scale factor
            let scale = Int(update.message?.parameters.first ?? .empty)

            let userInfo = try StoredUserInfo.query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .sort(\.$createdAt, .descending)
                .first()
                .wait()

            switch app.arcaeaLimitedAPI.bestInfo(friendCode: relationship.arcaeaFriendCode) {
            case let .success((best30, storedBest30)):
                try update.message?.reply(text: best30.formatted(app: app, userInfo: userInfo), bot: bot)

                let songs = try Song.query(on: app.db).all().wait()
                let image = try app.imageRenderer.render(
                    storedBest30,
                    songs: songs,
                    scale: scale
                )

                if scale != nil {
                    // Send original photo as document
                    try bot.sendDocument(params: .init(
                        chatId: .chat(update.message?.chat.id ?? .zero),
                        document: .file(.init(
                            filename: "\(userInfo?.displayName ?? "$displayName")_best30_\(Date()).png",
                            data: image.export(),
                            mimeType: "image/png"
                        ))
                    ))
                } else {
                    // Send photo as compressed image
                    try bot.sendPhoto(params: .init(
                        chatId: .chat(update.message?.chat.id ?? .zero),
                        photo: .file(.init(filename: "best30", data: try image.export())),
                        replyMarkup: app.tgConfig?
                            .webAppBaseUrl == nil ? nil : .inlineKeyboardMarkup(.init(inlineKeyboard: [[
                                CallbackDataEvent.b30Url(
                                    baseUrl: app.tgConfig!.webAppBaseUrl!,
                                    uuid: storedBest30.id
                                ).button,
                            ]]))
                    ))
                }

            case let .failure(error):
                try update.message?.reply(
                    text: "\(error.errorDescription ?? "Error description found.")",
                    bot: bot
                )
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func getAliasHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(
            commands: ["/getalias"],
            options: [.editedUpdates],
            botUsername: app.tgConfig?.botUsername
        ) { update, bot in
            guard update.message?.parameters.count ?? .zero > .zero,
                  let searchText = update.message?.parameters.joined(separator: " ")
            else {
                try update.message?.reply(text: "Please specify a song id.", bot: bot)
                return
            }

            guard let song = try Song.search(searchText, in: app, options: .includeAliases).wait().first
            else {
                try update.message?.reply(text: "There are no songs named \(searchText).", bot: bot)
                return
            }

            var text = "\(song.nameEn)\n`\(song.sid)`\n---\n"

            text += try Alias.query(on: app.db)
                .filter(\.$sid, .equal, song.sid)
                .all()
                .wait()
                .map { $0.alias }
                .joined(separator: "\n")

            try update.message?.reply(
                text: text.markdownV2Escaped,
                bot: bot,
                parseMode: .markdownV2
            )
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func getSongHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(
            commands: ["/getsong"],
            options: [.editedUpdates],
            botUsername: app.tgConfig?.botUsername
        ) { update, bot in
            guard update.message?.parameters.count ?? .zero > .zero,
                  let searchText = update.message?.parameters.joined(separator: " ")
            else {
                try update.message?.reply(text: "Please specify a song id.", bot: bot)
                return
            }

            guard let song = try Song.search(searchText, in: app, options: .includeAliases).wait().first
            else {
                try update.message?.reply(text: "There are no songs named \(searchText).", bot: bot)
                return
            }

            let text = try { () -> String in
                let encoder = JSONEncoder()
                encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
                let data = try encoder.encode(song)
                guard let string = String(data: data, encoding: .utf8)
                else { throw Abort(.internalServerError) }
                return string
            }()

            let buttons: [[TGInlineKeyboardButton]] = {
                if let baseUrl = app.tgConfig?.webAppBaseUrl {
                    return [[
                        CallbackDataEvent.img(baseUrl, song.sid, .past).button,
                        CallbackDataEvent.img(baseUrl, song.sid, .present).button,
                    ], [
                        CallbackDataEvent.img(baseUrl, song.sid, .future).button,
                        (song.ratingByd != nil && song.ratingByd != -1) ? CallbackDataEvent
                            .img(baseUrl, song.sid, .beyond)
                            .button : nil,
                    ].compactMap { $0 }]
                } else { return [[]] }
            }()

            try update.message?.reply(
                text: "`\(text)`".markdownV2Escaped,
                bot: bot,
                parseMode: .markdownV2,
                replyMarkup: .inlineKeyboardMarkup(.init(inlineKeyboard: buttons))
            )
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func addAliasHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/addalias"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Ensure this user has operator permission
            guard try BindingRelationship.query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()?
                .isOperator == true || String(telegramUserId) == app.tgConfig?.adminUserId
            else {
                try update.message?.reply(text: "Sorry, permission denied.", bot: bot)
                return
            }

            // Parse song id
            guard let searchText = update.message?.parameters.first else {
                try update.message?.reply(text: "Please specify a song id.", bot: bot)
                return
            }

            // Parse new alias
            guard let alias = update.message?.parameters.dropFirst().first else {
                try update.message?.reply(text: "Please specify a new alias.", bot: bot)
                return
            }

            // Check if song exist
            guard let song = try Song.query(on: app.db).filter(\.$sid == searchText).first().wait() else {
                try update.message?.reply(text: "There are no songs named \(searchText).", bot: bot)
                return
            }

            do {
                try Alias(sid: song.sid, alias: alias).save(on: app.db).wait()
                try update.message?.reply(text: "New alias saved.\n\(alias) -> \(song.sid)", bot: bot)
            } catch {
                try update.message?.reply(text: "\(error.localizedDescription)", bot: bot)
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func calHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/cal"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in
            guard let searchText = update.message?.parameters.first else {
                try update.message?.reply(text: "You have to specify a song id or an alias.", bot: bot)
                return
            }

            let score: Int? = Int(update.message?.parameters.dropFirst().first ?? .empty) ??
                Int(update.message?.parameters.dropFirst(2).first ?? .empty)

            let difficulty: Difficulty = update.message?.parameters.dropFirst().first?.toDifficulty() ??
                update.message?.parameters.dropFirst(2).first?.toDifficulty() ?? .future

            guard let song = try Song.search(searchText, in: app, options: .includeAliases).wait().first
            else {
                try update.message?.reply(text: "There are no songs named \(searchText).", bot: bot)
                return
            }

            var text = """
            \(song.nameEn) \(difficulty.abbr.capitalized) \(song.constant(of: difficulty))\n
            """

            text += score != nil ?
                "\(score!) -> \(String(format: "%.3f", song.playPtt(difficulty: difficulty, score: score!)))\n------\n" :
                ""

            text +=
                [10_000_000, 9_900_000, 9_800_000, 9_500_000, 9_200_000, 8_900_000, 8_600_000]
                .map { levelScore in
                    "\(levelScore) -> \(song.playPtt(difficulty: difficulty, score: levelScore))"
                }.joined(separator: "\n")

            try update.message?.reply(text: text, bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func statsHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/stats"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in
            let time24hAgo = Date(timeIntervalSinceNow: -86400).timeIntervalSince1970
            let best30Count = try StoredBest30.query(on: app.db)
                .filter(\.$createdAt.$timestamp, .greaterThanOrEqual, time24hAgo).count().wait()
            let myCount = try StoredPlay.query(on: app.db)
                .filter(\.$createdAt.$timestamp, .greaterThanOrEqual, time24hAgo).count().wait()
            let recentCount = try StoredUserInfo.query(on: app.db)
                .filter(\.$createdAt.$timestamp, .greaterThanOrEqual, time24hAgo).count().wait()
            try update.message?.reply(text: """
                                      \(memoryReport())

                                      In the last 24 hours, there are total of
                                      `\(best30Count) /best30` requests,
                                      `\(myCount) /my` requests,
                                      `\(recentCount) /recent` requests.
                                      """.markdownV2Escaped,
                                      bot: bot, parseMode: .markdownV2)
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func opHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/op"],
                                       botUsername: app.tgConfig?.botUsername) { update, bot in

            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Only admin can prompt ops
            guard String(telegramUserId) == app.tgConfig?.adminUserId else {
                try update.message?.reply(text: "Sorry, permission denied.", bot: bot)
                return
            }

            guard let targetUser = update.message?.replyToMessage?.from?.id else { return }

            guard let relationship = try BindingRelationship.query(on: app.db)
                .filter(\.$telegramUserId, .equal, targetUser).first().wait()
            else {
                try update.message?.reply(text: "User not bound.", bot: bot)
                return
            }

            relationship.isOperator.toggle()
            try relationship.save(on: app.db).wait()
            if !relationship.isOperator { // Actually, *was* operator
                try update.message?.reply(text: "This user is not an operator anymore.", bot: bot)
            } else {
                try update.message?.reply(text: "This user is now an operator.", bot: bot)
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func historyHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/recenthistory"]) { update, bot in
            // Ensure valid telegram user
            guard let telegramUserId = update.message?.from?.id else { return }

            // Ensure bound
            guard let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            else {
                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
                return
            }

            guard let userInfo = try StoredUserInfo.query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .sort(\.$createdAt, .descending)
                .first()
                .wait()
            else {
                throw Abort(.internalServerError)
            }

            let allHistory = try StoredPlay.query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .sort(\.$createdAt).all().wait()

            guard !allHistory.isEmpty else {
                try update.message?.reply(text: "You have no play record.", bot: bot)
                return
            }

            var keyboardButtons: [[TGInlineKeyboardButton]] = []
            if allHistory.count > 1 {
                keyboardButtons.append([
                    CallbackDataEvent.prevPlay(uuid: allHistory[allHistory.count - 2].id!)
                        .button,
                ])
            }

            print("\(keyboardButtons)")

            try update.message?.reply(
                text: allHistory.last!.formatted(app: app, userInfo: userInfo).markdownV2Escaped,
                bot: bot,
                parseMode: .markdownV2,
                replyMarkup: .inlineKeyboardMarkup(.init(inlineKeyboard: keyboardButtons))
            )
        }
        bot.connection.dispatcher.add(handler)
    }
}
