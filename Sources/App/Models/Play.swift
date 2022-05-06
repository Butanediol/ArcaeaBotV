import Vapor

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

extension Play {
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
