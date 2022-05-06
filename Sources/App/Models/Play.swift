import Fluent
import Vapor

// MARK: - Play

protocol PlayProtocol {
    var songID: String { get }
    var timePlayed: Int { get }
    var difficulty: Difficulty { get }
    var score: Int { get }
    var pureCount: Int { get }
    var shinyPureCount: Int { get }
    var farCount: Int { get }
    var lostCount: Int { get }
}

struct Play: Codable, PlayProtocol {
    let songID: String
    let difficulty: Difficulty
    let score, shinyPureCount, pureCount: Int
    let farCount, lostCount, recollectionRate, timePlayed: Int
    let gaugeType: Int
    let potentialValue: Double?

    enum CodingKeys: String, CodingKey {
        case songID = "song_id"
        case difficulty, score
        case shinyPureCount = "shiny_pure_count"
        case pureCount = "pure_count"
        case farCount = "far_count"
        case lostCount = "lost_count"
        case recollectionRate = "recollection_rate"
        case timePlayed = "time_played"
        case gaugeType = "gauge_type"
        case potentialValue = "potential_value"
    }
}

extension Play {
    func toStored(arcaeaFriendCode: ArcaeaFriendCode) -> StoredPlay {
        .init(
            arcaeaFriendCode: arcaeaFriendCode,
            songID: songID,
            difficulty: difficulty,
            score: score,
            shinyPureCount: shinyPureCount,
            pureCount: pureCount,
            farCount: farCount,
            lostCount: lostCount,
            recollectionRate: recollectionRate,
            timePlayed: timePlayed,
            gaugeType: gaugeType,
            potentialValue: potentialValue
        )
    }
}

extension PlayProtocol {
    var relativeTime: String {
        let playDate = Date(timeIntervalSince1970: Double(timePlayed / 1000))

        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "en_US")
        return formatter.localizedString(for: playDate, relativeTo: Date())
    }

    func formatted<T: UserInfoProtocol>(app: Application, userInfo: T) throws -> String {
        let song = try Song.query(on: app.db).filter(\.$sid, .equal, songID).first().wait()

        let userPtt = userInfo.potential != nil ? String(Double(userInfo.potential!) / 100) : "Hidden"
        let playPtt = song?.playPtt(difficulty: difficulty, score: score) ?? -1

        return """
        \(userInfo.displayName)(\(userPtt)) played `\(song?.nameEn ?? songID)` \(relativeTime)
        Difficulty: \(difficulty.fullName) (\((song?.constant(of: difficulty) ?? -1)
            .formatString(withDigits: 1)))
        Score: \(score)
        PlayPTT: \(playPtt.formatString(withDigits: 2))
        \(pureCount) (+\(shinyPureCount)) / \(farCount) / \(lostCount)
        """
    }
}

final class StoredPlay: Model, Content, PlayProtocol {
    static let schema = "stored_play"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "arcaea_friend_code")
    var arcaeaFriendCode: ArcaeaFriendCode

    @Field(key: "sid")
    var songID: String

    @Field(key: "difficulty")
    var difficulty: Difficulty

    @Field(key: "score")
    var score: Int

    @Field(key: "shiny_pure_count")
    var shinyPureCount: Int

    @Field(key: "pure_count")
    var pureCount: Int

    @Field(key: "far_count")
    var farCount: Int

    @Field(key: "lost_count")
    var lostCount: Int

    @Field(key: "recollection_rate")
    var recollectionRate: Int

    @Field(key: "time_played")
    var timePlayed: Int

    @Field(key: "gauge_type")
    var gaugeType: Int

    @Field(key: "potential_value")
    var potentialValue: Double?

    @Timestamp(key: "created_at", on: .create, format: .unix)
    var createdAt: Date?

    init() {}

    init(
        arcaeaFriendCode: ArcaeaFriendCode,
        songID: String,
        difficulty: Difficulty,
        score: Int,
        shinyPureCount: Int,
        pureCount: Int,
        farCount: Int,
        lostCount: Int,
        recollectionRate: Int,
        timePlayed: Int,
        gaugeType: Int,
        potentialValue: Double? = nil
    ) {
        self.arcaeaFriendCode = arcaeaFriendCode
        self.songID = songID
        self.difficulty = difficulty
        self.score = score
        self.shinyPureCount = shinyPureCount
        self.pureCount = pureCount
        self.farCount = farCount
        self.lostCount = lostCount
        self.recollectionRate = recollectionRate
        self.timePlayed = timePlayed
        self.gaugeType = gaugeType
        self.potentialValue = potentialValue
    }
}
