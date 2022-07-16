import Fluent
import telegram_vapor_bot
import Vapor

enum CallbackDataEvent: Codable {
    case my(_ songId: String, _ difficulty: Difficulty)
    case recent
    case img(_ baseUrl: String, _ songId: String, _ difficulty: Difficulty)
    case b30Url(baseUrl: String, uuid: UUID?)

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
        }
    }
}

enum CallbackBotHandler {
    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        callbackDispatcher(app: app, bot: bot)
    }

    private static func callbackDispatcher(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCallbackQueryHandler(pattern: ".*") { update, _ in
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
            }
        }
        bot.connection.dispatcher.add(handler)
    }
}
