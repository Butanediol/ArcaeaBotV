import Fluent
import telegram_vapor_bot
import Vapor

enum CallbackDataEvent: Codable {
    case my(String, Difficulty)

    var text: String {
        switch self {
        case .my:
            return "🔍"
        }
    }

    init?(from callbackData: String?) {
        guard let callbackData = callbackData, let data = callbackData.data(using: .utf8)
        else { return nil }
        let callbackEvent = try! JSONDecoder().decode(CallbackDataEvent.self, from: data)
        self = callbackEvent
    }

    var callbackData: String? {
        if let data = try? JSONEncoder().encode(self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    var button: TGInlineKeyboardButton {
        .init(text: text, callbackData: callbackData)
    }
}

enum CallbackBotHandler {
    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        callbackDispatcher(app: app, bot: bot)
    }

    private static func callbackDispatcher(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCallbackQueryHandler(pattern: ".*") { update, bot in
            guard let callbackEvent = update.callbackQuery?.data else {
                app.logger.error("Cannot get callback data.")
                return
            }
            guard let event = CallbackDataEvent(from: callbackEvent) else {
                app.logger.error("Failed to decode callback data.")
                app.logger.error("\(callbackEvent)")
                return
            }

            switch event {
            case let .my(songId, difficulty):
                try myCallbackHandler(
                    app: app,
                    bot: bot,
                    update: update,
                    songId: songId,
                    difficulty: difficulty
                )
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func myCallbackHandler(
        app: Vapor.Application,
        bot: TGBotPrtcl,
        update: TGUpdate,
        songId: String,
        difficulty: Difficulty
    ) throws {
        // Ensure valid telegram user

        guard let telegramUserId = update.callbackQuery?.from.id else {
            app.logger.error("Failed to get telegram user.")
            return
        }

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

        let result = app.arcaeaLimitedAPI.scoreInfo(
            friendCode: relationship.arcaeaFriendCode,
            difficulty: difficulty,
            songId: songId
        )
        switch result {
        case let .success(play):
            try bot.sendMessage(params: .init(
                chatId: .chat(update.callbackQuery?.message?.chat.id ?? 0),
                text: play.formatted(app: app, userInfo: userInfo).markdownV2Escaped,
                parseMode: .markdownV2
            ))
        case let .failure(error):
            try bot.sendMessage(params: .init(
                chatId: .chat(update.callbackQuery?.message?.chat.id ?? 0),
                text: "\(error.errorDescription)".markdownV2Escaped,
                parseMode: .markdownV2
            ))
        }
    }
}
