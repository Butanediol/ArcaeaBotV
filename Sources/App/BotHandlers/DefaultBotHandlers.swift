import Vapor
import telegram_vapor_bot

final class DefaultBotHandlers {

    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        startHandler(app: app, bot: bot)
        bindHandler(app: app, bot: bot)
    }

    private static func startHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/start"]) { update, bot in
            try update.message?.reply(text: "Hello telegram user.", bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func bindHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/bind"]) { update, bot in
            guard let telegramUserId = update.message?.from?.id else { return }
            print(telegramUserId)

            guard let arcaeaFriendCode = update.message?.text else { return }
            try update.message?.reply(text: "Hello, \(arcaeaFriendCode)", bot: bot)


            if let relationship = try BindingRelationship
                .query(on: app.db)
                .filter(\.$telegramUserId, .equal, telegramUserId)
                .first()
                .wait() {
                // Already binded
                try update.message?.reply(text: "You have already binded, \(relationship.arcaeaFriendCode)", bot: bot)
            } else {
                // New user

                guard let arcaeaFriendCode = update.message?.text else { return }

                try update.message?.reply(text: "Hello, \(arcaeaFriendCode)", bot: bot)

                // BindingRelationship(telegramUserId: telegramUserId, arcaeaFriendCode: arcaeaFriendCode)
            }
                
        }
        bot.connection.dispatcher.add(handler)
    }

}