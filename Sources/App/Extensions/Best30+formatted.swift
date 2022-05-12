import Vapor

extension Best30 {
    func formatted<T: UserInfoProtocol>(app: Application, userInfo: T?) throws -> String {
        var text = ""

        let songs = try Song.query(on: app.db).all().wait()

        let b30Avg = reduce(into: 0) { result, play in
            result += play.potentialValue ?? 0
        } / Double(count)
        text += "B30 Avg: \(String(format: "%.3f", b30Avg))\n"

        if let userPtt = userInfo?.potential {
            let r10 = 4 * Double(userPtt) / 100 - b30Avg * 3
            text += "R10 Avg: \(String(format: "%.3f", r10))\n"
        } else {
            text += "\n"
        }

        indices.forEach { index in
            let play = self[index]
            let song = songs.first { $0.sid == play.songID }
            let songName = song?.nameEn ?? play.songID

            text += """
            ⎾\(String(format: "%02d", index + 1)) \(songName) \(play.difficulty.abbr.uppercased()) \(song?
                .constant(of: play.difficulty) ?? -1)
            ⎿\(play.score) \(Double(play.potentialValue ?? -1).formatString(withDigits: 2))\n
            """
        }

        return text
    }
}
