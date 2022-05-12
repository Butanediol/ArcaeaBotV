import Fluent
import Foundation
import Vapor

final class StoredBest30: Model, Content {
    static let schema = "stored_best30"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "arcaea_friend_code")
    var arcaeaFriendCode: ArcaeaFriendCode

    @Field(key: "plays")
    var plays: [Play]

    @Timestamp(key: "created_at", on: .create, format: .unix)
    var createdAt: Date?

    init() {}

    init(plays: [Play], arcaeaFriendCode: ArcaeaFriendCode) {
        self.plays = plays
        self.arcaeaFriendCode = arcaeaFriendCode
    }
}
