import Fluent
import Foundation
import Vapor

/// This model linked a Arcaea Friend Code to a single play record.
/// And will be stored in database.
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
