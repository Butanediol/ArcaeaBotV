import Fluent
import Vapor

// MARK: - UserInfoResponse
struct UserInfoResponse: Codable {
    let userInfo: UserInfo

    enum CodingKeys: String, CodingKey {
        case userInfo = "data"
    }
}

// MARK: - UserInfo
struct UserInfo: Codable {
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
        .init(friendCode: friendCode, displayName: self.displayName, potential: self.potential)
    }
}

extension UserInfo {
    var relativeTime: String {
        let playDate = Date(timeIntervalSince1970: Double(self.lastPlayedSong.timePlayed / 1000))

        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "en_US")
        return formatter.localizedString(for: playDate, relativeTo: Date())
    }

    func formatted(app: Application) throws -> String {
        let song = try Song.query(on: app.db).filter(\.$sid, .equal, lastPlayedSong.songID).first().wait()

        let userPtt = potential != nil ? String(Double(potential!) / 100) : "Hidden"
        let playPtt = song?.playPtt(difficulty: lastPlayedSong.difficulty, score: lastPlayedSong.score) ?? -1

        return """
        \(self.displayName)(\(userPtt)) played `\(song?.nameEn ?? lastPlayedSong.songID)` \(relativeTime)
        Difficulty: \(lastPlayedSong.difficulty.fullName) (\((song?.constant(of: lastPlayedSong.difficulty) ?? -1).formatString(withDigits: 1)))
        Score: \(lastPlayedSong.score)
        PlayPTT: \(playPtt.formatString(withDigits: 2))
        \(lastPlayedSong.pureCount) (+\(lastPlayedSong.shinyPureCount)) / \(lastPlayedSong.farCount) / \(lastPlayedSong.lostCount)
        """
    }
}

// MARK: - StoredUserInfo
final class StoredUserInfo: Model, Content {
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
        self.arcaeaFriendCode = friendCode
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