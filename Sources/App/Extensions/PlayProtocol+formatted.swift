import Foundation
import Vapor

extension PlayProtocol {
    /// This function generates a formatted string of this play record.
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
