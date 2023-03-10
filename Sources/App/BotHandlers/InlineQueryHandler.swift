import Foundation
import TelegramVaporBot

class TGInlineQueryHandler: TGHandlerPrtcl {
    var id: Int

    let callback: TGHandlerCallbackAsync

    init(
        id: Int = 0,
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        self.id = id
        self.callback = callback
    }

    func check(update: TelegramVaporBot.TGUpdate) -> Bool {
        return update.inlineQuery != nil
    }

    func handle(update: TelegramVaporBot.TGUpdate, bot: TelegramVaporBot.TGBot) async throws {
        do {
            try await callback(update, bot)
        } catch {
            TGBot.log.error(error.logMessage)
        }
    }


}