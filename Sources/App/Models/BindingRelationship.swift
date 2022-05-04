import Fluent
import Vapor

typealias TelegramUserId = Int64
typealias ArcaeaFriendCode = String

final class BindingRelationship: Model, Content {
    static let schema = "binding_relationship"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "telegram_user_id")
    var telegramUserId: TelegramUserId

    @Field(key: "arcaea_friend_code")
    var arcaeaFriendCode: ArcaeaFriendCode
}