import telegram_vapor_bot
import Foundation

class TGInlineQueryHandler: TGHandlerPrtcl {

    public var id: Int = 0

    public var name: String

    let callback: TGHandlerCallback

    public init(
    	name: String = String(describing: TGInlineQueryHandler.self),
    	_ callback: @escaping TGHandlerCallback
    ) {
    	self.name = name
    	self.callback = callback
    }

    func check(update: TGUpdate) -> Bool {
        return update.inlineQuery != nil
    }

    func handle(update: TGUpdate, bot: TGBotPrtcl) {
        do {
        	try callback(update, bot)
        } catch {
        	TGBot.log.error(error.logMessage)
        }
    }
}
