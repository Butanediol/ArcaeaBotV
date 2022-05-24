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

extension Color {
    static let pmGreen = Color(red: 199 / 255, green: 248 / 255, blue: 78 / 255, alpha: 1)
    static let frBlue = Color(red: 71 / 255, green: 141 / 255, blue: 1, alpha: 1)
    static let prsGreen = Color(red: 199 / 255, green: 248 / 255, blue: 78 / 255, alpha: 1)
    static let ftrPurple = Color(red: 195 / 255, green: 133 / 255, blue: 244 / 255, alpha: 1)
    static let bydRed = Color(red: 255 / 255, green: 130 / 255, blue: 136 / 255, alpha: 1)
}

class Best30ImageRenderer {
    let font: String
    let titleFont: String

    init() throws {
        guard
            let font = Bundle.module.path(forResource: "Exo-Regular", ofType: "ttf"),
            let titleFont = Bundle.module.path(forResource: "NotoSansCJKsc-Regular", ofType: "otf")
        else {
            throw Error.invalidImage(reason: "Failed to initialize renderer due to invalid font file.")
        }
        self.font = font
        self.titleFont = titleFont
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

            let card = try renderCard(play: best30.plays[index], song: song, index: index + 1, scale: scale)

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
        let titleFontSize = Double(18 * scale)
        let bodyFontSize = Double(10 * scale)
        let songTitlePoint = Point(x: 10 * scale, y: 10 * scale + Int(titleFontSize))
        let datePoint = Point(x: 10 * scale, y: 32 * scale + Int(bodyFontSize))
        let noteCountPoint = Point(x: 10 * scale, y: 68 * scale + Int(bodyFontSize))
        let scorePoint = Point(x: 10 * scale, y: 81 * scale + Int(titleFontSize))

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
                    return .pmGreen
                } else { return .frBlue }
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
        let title = song.nameJp != "" ? song.nameJp ?? "Nil" : song.nameEn
        var titleColor: Color {
            switch play.difficulty {
            case .past:
                return .white
            case .present:
                return .prsGreen
            case .future:
                return .ftrPurple
            case .beyond:
                return .bydRed
            }
        }
        let titleBoundingBox = image.renderText(
            title,
            from: songTitlePoint,
            fontList: [titleFont],
            color: titleColor,
            size: titleFontSize
        )

        // Date
        let date = play.relativeTime
        image.renderText(
            date,
            from: datePoint,
            fontList: [titleFont],
            color: .white,
            size: bodyFontSize
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

        if titleBoundingBox.upperRight.x > canvasSize.width {
            for x in canvasSize.width - 90 * scale ..< canvasSize.width {
                let ratio = pow(1 - Double(x - canvasSize.width + 90 * scale) / Double(90 * scale), 0.5)
                for y in titleBoundingBox.upperRight.y ... titleBoundingBox.lowerRight.y {
                    var color: Color {
                        let original = image.get(pixel: Point(x: x, y: y))
                        return .init(
                            red: original
                                .redComponent * ratio,
                            green: original
                                .greenComponent * ratio,
                            blue: original
                                .blueComponent * ratio,
                            alpha: 1
                        )
                    }
                    image.set(pixel: Point(x: x, y: y), to: color)
                }
            }
        }

        return image
    }
}
