import Fluent
import telegram_vapor_bot
import Vapor

enum CallbackDataEvent: Codable {
    case my(_ songId: String, _ difficulty: Difficulty)
    case recent
    case img(_ baseUrl: String, _ songId: String, _ difficulty: Difficulty)
    case b30Url(baseUrl: String, uuid: UUID?)
    case prevPlay(uuid: UUID)
    case nextPlay(uuid: UUID)

    var text: String {
        switch self {
        case .my:
            return "🔍 /my"
        case .recent:
            return "⌚️ /recent"
        case let .img(_, _, difficulty):
            return "🖼️ Cover \(difficulty.abbr.uppercased())"
        case .b30Url:
            return "🔗 Share Link"
        case .prevPlay:
            return "⬅️ Previous"
        case .nextPlay:
            return "➡️ Next"
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
        switch self {
        case let .my(songId, difficulty):
            return .init(text: text, switchInlineQueryCurrentChat: "\(songId) \(difficulty.abbr)")
        case .recent:
            return .init(text: text, switchInlineQueryCurrentChat: "")
        case let .img(baseUrl, songId, difficulty):
            return .init(text: text, url: baseUrl + "/img/\(songId)/\(difficulty.rawValue)")
        case let .b30Url(baseUrl, id):
            return .init(text: text, url: baseUrl + "/img/best30/\(id?.uuidString ?? .empty)")
        case .prevPlay:
            return .init(text: text, callbackData: callbackData)
        case .nextPlay:
            return .init(text: text, callbackData: callbackData)
        }
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
            case .my:
                break
            case .recent:
                break
            case .img:
                break
            case .b30Url:
                break
            case let .prevPlay(uuid):
                try playRecordHandler(app: app, bot: bot, update: update, uuid: uuid)
            case let .nextPlay(uuid):
                try playRecordHandler(app: app, bot: bot, update: update, uuid: uuid)
            }
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func playRecordHandler(
        app: Vapor.Application,
        bot: TGBotPrtcl,
        update: TGUpdate,
        uuid: UUID
    ) throws {
        guard let callbackQuery = update.callbackQuery else { return }

        // Ensure bound
        guard let relationship = try BindingRelationship
            .query(on: app.db)
            .filter(\.$telegramUserId, .equal, callbackQuery.from.id)
            .first()
            .wait()
        else {
            try bot
                .answerCallbackQuery(params: .init(callbackQueryId: callbackQuery.id,
                                                   text: "You have not bound yet, try /bind."))
            return
        }

        guard let userInfo = try StoredUserInfo.query(on: app.db)
            .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
            .first()
            .wait()
        else {
            try bot
                .answerCallbackQuery(params: .init(callbackQueryId: callbackQuery.id,
                                                   text: "Failed to get user info."))
            return
        }

        let allHistory = try StoredPlay.query(on: app.db)
            .filter(\.$arcaeaFriendCode, .equal, relationship.arcaeaFriendCode)
            .sort(\.$timePlayed).all().wait()

        guard let index = allHistory.firstIndex(where: { $0.id == uuid }) else {
            try bot
                .answerCallbackQuery(params: .init(callbackQueryId: callbackQuery.id,
                                                   text: "Failed to get index."))
            return
        }

        let keyboardButtons: [[TGInlineKeyboardButton]] = [[
            index - 1 > 0 ? CallbackDataEvent.prevPlay(uuid: allHistory[index - 1].id ?? UUID()).button : nil,
            index + 1 < allHistory.count ? CallbackDataEvent
                .nextPlay(uuid: allHistory[index + 1].id ?? UUID()).button : nil,
        ].compactMap { $0 }]

        try callbackQuery.message?.edit(
            text: allHistory[index].formatted(app: app, userInfo: userInfo).markdownV2Escaped,
            bot: bot,
            parseMode: .markdownV2,
            replyMarkup: .init(inlineKeyboard: keyboardButtons)
        )
    }
}
