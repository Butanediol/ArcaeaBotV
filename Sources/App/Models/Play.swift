import Foundation

// MARK: - Play
struct Play: Codable {
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