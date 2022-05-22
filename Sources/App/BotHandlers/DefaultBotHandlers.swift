import Fluent
import telegram_vapor_bot
import Vapor

final class DefaultBotHandlers {
    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        startHandler(app: app, bot: bot)
        bindHandler(app: app, bot: bot)
        unbindHandler(app: app, bot: bot)
        recentHandler(app: app, bot: bot)
        myHandler(app: app, bot: bot)
        best30Handler(app: app, bot: bot)
        getAliasHandler(app: app, bot: bot)
        addAliasHandler(app: app, bot: bot)
        calHandler(app: app, bot: bot)
        inlineHandler(app: app, bot: bot)
        statsHandler(app: app, bot: bot)
        opHandler(app: app, bot: bot)
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
                        text: "\(error.errorDescription)".markdownV2Escaped,
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
                    replyMarkup: .inlineKeyboardMarkup(.init(inlineKeyboard: [[CallbackDataEvent
                            .my(userInfo.lastPlayedSong.songID, userInfo.lastPlayedSong.difficulty)
                            .button]]))
                )

            case let .failure(error):
                try update.message?.reply(
                    text: "\(error.errorDescription)".markdownV2Escaped,
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
                    parseMode: .markdownV2
                )
            case let .failure(error):
                try update.message?.reply(
                    text: "\(error.errorDescription)".markdownV2Escaped,
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

            let userInfo = try StoredUserInfo.query(on: app.db)
                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                .first()
                .wait()

            let result = app.arcaeaLimitedAPI.bestInfo(friendCode: relationship.arcaeaFriendCode)
            switch result {
            case let .success(best30):
                try update.message?.reply(text: best30.formatted(app: app, userInfo: userInfo), bot: bot)
            case let .failure(error):
                try update.message?.reply(text: "\(error.errorDescription)", bot: bot)
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
            guard update.message?.parameters.count ?? 0 > 0,
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

            let aliases = try Alias.query(on: app.db)
                .filter(\.$sid, .equal, song.sid)
                .all()
                .wait()
                .map { $0.alias }
                .joined(separator: "\n")

            try update.message?.reply(
                text: ("\(song.nameEn)\n`\(song.sid)`\n---\n" + aliases).markdownV2Escaped,
                bot: bot,
                parseMode: .markdownV2
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

            let score = Int(update.message?.parameters.dropFirst().first ?? "")
            let difficulty: Difficulty = update.message?.parameters.dropFirst(2).first?
                .toDifficulty() ?? .future

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

    private static func inlineHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGInlineQueryHandler { update, bot in

            // This should never happen
            guard let inlineQuery = update.inlineQuery else { return }

            let queries = inlineQuery.query.split(separator: " ")

            let telegramUserId = inlineQuery.from.id

            var queryError: Error?

            var results: [TGInlineQueryResult] = []

            if let relationship = try BindingRelationship.query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait()
            {
                // User bound
                if inlineQuery.query == "" {
                    // Query is empty -> /recent
                    let result = app.arcaeaLimitedAPI.userInfo(friendCode: relationship.arcaeaFriendCode)
                    switch result {
                    case let .success(userInfo):
                        results.append(
                            .article(
                                .init(
                                    type: "article",
                                    id: UUID().uuidString,
                                    title: "Recent Play",
                                    inputMessageContent: .inputTextMessageContent(
                                        .init(
                                            messageText: try userInfo.formatted(app: app).markdownV2Escaped,
                                            parseMode: "markdownV2"
                                        )
                                    )
                                )
                            )
                        )
                    case let .failure(error):
                        queryError = error
                    }
                } else {
                    // Query is not empty -> /my
                    guard let query = queries.first else { return }
                    if let song = try Song.search(query, in: app, options: .includeAliases, .exactMatch)
                        .wait().first
                    {
                        let difficulty: Difficulty = queries.dropFirst().first?.toDifficulty() ?? .future

                        let result = app.arcaeaLimitedAPI.scoreInfo(
                            friendCode: relationship.arcaeaFriendCode,
                            difficulty: difficulty,
                            songId: song.sid
                        )
                        switch result {
                        case let .success(play):

                            if let userInfo = try StoredUserInfo.query(on: app.db)
                                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                                .first()
                                .wait()
                            {
                                results.append(
                                    .article(
                                        .init(
                                            type: "article",
                                            id: UUID().uuidString,
                                            title: song.nameEn,
                                            inputMessageContent: .inputTextMessageContent(
                                                .init(
                                                    messageText: try play
                                                        .formatted(app: app, userInfo: userInfo)
                                                        .markdownV2Escaped,
                                                    parseMode: "markdownV2"
                                                )
                                            )
                                        )
                                    )
                                )
                            } else { queryError = Abort(.internalServerError) }
                        case let .failure(error):
                            queryError = error
                        }

                    } else {
                        results.append(
                            .article(
                                .init(
                                    type: "article",
                                    id: UUID().uuidString,
                                    title: "Error",
                                    inputMessageContent: .inputTextMessageContent(
                                        .init(messageText: "There are no songs named \(inlineQuery.query).")
                                    )
                                )
                            )
                        )
                    }
                }

            } else {
                // User not bound
                results.append(
                    .article(
                        .init(
                            type: "article",
                            id: UUID().uuidString,
                            title: "Not bound",
                            inputMessageContent: .inputTextMessageContent(
                                .init(messageText: "You have not bound yet.")
                            )
                        )
                    )
                )
            }

            if let queryError = queryError {
                results.append(
                    .article(
                        .init(
                            type: "article",
                            id: UUID().uuidString,
                            title: queryError.localizedDescription,
                            inputMessageContent: .inputTextMessageContent(
                                .init(messageText: queryError.localizedDescription)
                            )
                        )
                    )
                )
            }

            let tgAnswerInlineQueryParams = TGAnswerInlineQueryParams(
                inlineQueryId: inlineQuery.id,
                results: results,
                cacheTime: 5
            )

            try bot.answerInlineQuery(params: tgAnswerInlineQueryParams)
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
}
