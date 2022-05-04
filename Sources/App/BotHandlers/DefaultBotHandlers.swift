import Vapor
import telegram_vapor_bot

final class DefaultBotHandlers {

    static func addhandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        startHandler(app: app, bot: bot)
        bindHandler(app: app, bot: bot)
        unbindHandler(app: app, bot: bot)
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
                    let arcaeaFriendCode = update.message?.parameters.joined(separator: " "),
                    arcaeaFriendCode.isValid
                else {
                    try update.message?.reply(text: "Invalid arcaea friend code.", bot: bot)
                    return 
                }

                try update.message?.reply(text: "Hello, \(arcaeaFriendCode)", bot: bot)

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
                try relationship.delete(on: app.db).wait()
                try update.message?.reply(text: "Goodbye, \(relationship.arcaeaFriendCode).", bot: bot)
            } else {
                // Not bound

                try update.message?.reply(text: "You have not bound yet, try /bind.", bot: bot)
            }
                
        }
        bot.connection.dispatcher.add(handler)
    }

}