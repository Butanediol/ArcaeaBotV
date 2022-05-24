import Foundation
import SwiftGD

extension Image {
    func draw(image: Image, on point: Point) {
        for h in 0 ..< image.size.height {
            for w in 0 ..< image.size.width {
                set(pixel: Point(x: point.x + w, y: point.y + h), to: image.get(pixel: Point(x: w, y: h)))
            }
        }
    }
}

class Best30ImageRenderer {
    let font: String

    init() throws {
        guard let font = Bundle.module.path(forResource: "Exo-Regular", ofType: "ttf")
        else {
            throw Error.invalidImage(reason: "Failed to initialize renderer due to invalid font file.")
        }
        self.font = font
    }

    func render(_ best30: StoredBest30, songs: [Song]) throws -> Image {
        let scale = 2
        let canvasSize = Size(width: 1286 * scale, height: 965 * scale)

        guard let image = Image(width: canvasSize.width, height: canvasSize.height)
        else { throw Error.invalidImage(reason: "Failed to initialize image.") }

        for index in best30.plays.indices {
            let row = index / 5 + 1
            let col = index % 5

            guard let song = songs.first(where: { $0.sid == best30.plays[index].songID }) else { continue }

            let card = try renderCard(play: best30.plays[index], song: song, index: index, scale: scale)

            image.draw(
                image: card,
                on: Point(x: (103 + 220 * col) * scale, y: (73 + 140 * (row - 1)) * scale)
            )
        }

        return image
    }

    private func renderCard(play: Play, song: Song, index: Int, scale: Int = 2) throws -> Image {
        let canvasSize = Size(width: 200 * scale, height: 120 * scale)
        let indicatorPoint = Point(x: 0, y: 115 * scale)
        let indexPoint = Point(x: -10 * scale, y: 40 * scale)
        let indexFontSize = Double(48 * scale)
        let songTitlePoint = Point(x: 10 * scale, y: (10 + 18) * scale)
        let titleFontSize = Double(18 * scale)
        let noteCountPoint = Point(x: 10 * scale, y: (68 + 10) * scale)
        let bodyFontSize = Double(10 * scale)
        let scorePoint = Point(x: 10 * scale, y: (81 + 18) * scale)

        guard let image = Image(width: canvasSize.width, height: canvasSize.height)
        else { throw Error.invalidImage(reason: "Failed to initialize image.") }

        image.fillRectangle(
            topLeft: .zero,
            bottomRight: Point(x: canvasSize.width, y: canvasSize.height),
            color: .black
        )

        var indicatorColor: Color {
            if play.lostCount == 0 {
                if play.farCount == 0 {
                    return .init(red: 199 / 255, green: 248 / 255, blue: 78 / 255, alpha: 1)
                } else { return .init(red: 71 / 255, green: 141 / 255, blue: 1, alpha: 1) }
            } else {
                return .white
            }
        }
        image.fillRectangle(
            topLeft: indicatorPoint,
            bottomRight: Point(x: canvasSize.width, y: canvasSize.height),
            color: indicatorColor
        )

        // Index
        image.renderText(
            "#\(index)",
            from: indexPoint,
            fontList: [font],
            color: Color(red: 1, green: 1, blue: 1, alpha: 0.2),
            size: indexFontSize
        )

        // Song title
        image.renderText(
            song.nameEn,
            from: songTitlePoint,
            fontList: [font],
            color: .white,
            size: titleFontSize
        )

        // Note count
        let ptt = String(format: "%.2f", song.playPtt(difficulty: play.difficulty, score: play.score))
        image.renderText(
            "\(play.pureCount)(+\(play.shinyPureCount))/\(play.farCount)/\(play.lostCount)  " +
                "PTT: \(ptt)",
            from: noteCountPoint,
            fontList: [font],
            color: .white,
            size: bodyFontSize
        )

        // Score
        image.renderText(
            "\(play.score)",
            from: scorePoint,
            fontList: [font],
            color: .white,
            size: titleFontSize
        )

        return image
    }
}
