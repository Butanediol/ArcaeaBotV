import Fluent
import Vapor

protocol UserInfoProtocol {
    var potential: Int? { get }
    var displayName: String { get }
}

// MARK: - UserInfoResponse

struct UserInfoResponse: Codable {
    let userInfo: UserInfo

    enum CodingKeys: String, CodingKey {
        case userInfo = "data"
    }
}

// MARK: - UserInfo

struct UserInfo: Codable, UserInfoProtocol {
    let displayName: String
    let potential: Int?
    let partner: Partner
    let lastPlayedSong: Play

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case potential, partner
        case lastPlayedSong = "last_played_song"
    }
}

extension UserInfo {
    func toStored(friendCode: ArcaeaFriendCode) -> StoredUserInfo {
        .init(friendCode: friendCode, displayName: displayName, potential: potential)
    }

    func formatted(app: Application) throws -> String {
        return try lastPlayedSong.formatted(app: app, userInfo: self)
    }
}

// MARK: - StoredUserInfo

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

// MARK: - Partner

struct Partner: Codable {
    let partnerID: Int
    let isAwakened: Bool

    enum CodingKeys: String, CodingKey {
        case partnerID = "partner_id"
        case isAwakened = "is_awakened"
    }
}
