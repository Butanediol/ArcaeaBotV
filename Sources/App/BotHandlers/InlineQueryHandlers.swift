import Fluent
import TelegramVaporBot
import Vapor

enum InlineBotHandlers {
    static func addhandlers(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await inlineHandler(app: app, connection: connection)
    }

    private static func inlineHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        let handler = TGInlineQueryHandler { update, bot in

            // This should never happen
            guard let inlineQuery = update.inlineQuery else { return }

            let queries = inlineQuery.query.split(separator: " ")

            let telegramUserId = inlineQuery.from.id

            var queryError: Error?

            var results: [TGInlineQueryResult] = []

            if let relationship = try await BindingRelationship.query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
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
                    if let song = try await Song.search(query, in: app, options: .includeAliases, .exactMatch).first
                    {
                        let difficulty: Difficulty = queries.dropFirst().first?.toDifficulty() ?? .future

                        let result = app.arcaeaLimitedAPI.scoreInfo(
                            friendCode: relationship.arcaeaFriendCode,
                            difficulty: difficulty,
                            songId: song.sid
                        )
                        switch result {
                        case let .success(play):

                            if let userInfo = try await StoredUserInfo.query(on: app.db)
                                .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
                                .sort(\.$createdAt, .descending)
                                .first()
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
                                    title: "Error, no such song.",
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
                cacheTime: 1
            )

            try await bot.answerInlineQuery(params: tgAnswerInlineQueryParams)
        }
        await connection.dispatcher.add(handler)
    }
}
