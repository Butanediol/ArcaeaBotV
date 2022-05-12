import Fluent
import Foundation
import Vapor

final class StoredUserInfo: Model, Content, UserInfoProtocol {
    static let schema = "stored_user_info"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "arcaea_friend_code")
    var arcaeaFriendCode: ArcaeaFriendCode

    @Field(key: "display_name")
    var displayName: String

    @Field(key: "potential")
    var potential: Int?

    @Timestamp(key: "created_at", on: .create, format: .unix)
    var createdAt: Date?

    init() {}

    init(friendCode: ArcaeaFriendCode, displayName: String, potential: Int?) {
        arcaeaFriendCode = friendCode
        self.displayName = displayName
        self.potential = potential
    }
}
