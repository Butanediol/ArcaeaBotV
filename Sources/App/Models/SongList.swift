// This file was generated from JSON Schema using quicktype.

import Foundation

// MARK: - SongList

struct SongList: Codable {
    let songs: [Song]

    // MARK: - Song

    struct Song: Codable {
        let idx: Int
        let id: String
        let titleLocalized: SongTitleLocalized
        let artist, bpm: String
        let bpmBase: Double
        let songSet, purchase: String
        let audioPreview, audioPreviewEnd, side: Int
        let bg: String
        let bgInverse: String?
        let date: Int
        let version: String
        let difficulties: [SongList.Difficulty]
        let worldUnlock, remoteDL: Bool?
        let sourceLocalized: SourceLocalized?
        let sourceCopyright: String?
        let noStream: Bool?
        let jacketLocalized: JacketLocalized?
        let bgDaynight: BgDaynight?
        let bydLocalUnlock: Bool?
        let additionalFiles: [AdditionalFile]?
        let songlistHidden: Bool?

        enum CodingKeys: String, CodingKey {
            case idx, id
            case titleLocalized = "title_localized"
            case artist, bpm
            case bpmBase = "bpm_base"
            case songSet = "set"
            case purchase, audioPreview, audioPreviewEnd, side, bg
            case bgInverse = "bg_inverse"
            case date, version, difficulties
            case worldUnlock = "world_unlock"
            case remoteDL = "remote_dl"
            case sourceLocalized = "source_localized"
            case sourceCopyright = "source_copyright"
            case noStream = "no_stream"
            case jacketLocalized = "jacket_localized"
            case bgDaynight = "bg_daynight"
            case bydLocalUnlock = "byd_local_unlock"
            case additionalFiles = "additional_files"
            case songlistHidden = "songlist_hidden"
        }
    }

    enum AdditionalFile: String, Codable {
        case videoAudioOgg = "video_audio.ogg"
        case videoMp4 = "video.mp4"
    }

    // MARK: - BgDaynight

    struct BgDaynight: Codable {
        let day, night: String
    }

    // MARK: - Difficulty

    struct Difficulty: Codable {
        let ratingClass: Int
        let chartDesigner, jacketDesigner: String
        let rating: Int
        let jacketOverride, ratingPlus: Bool?
        let date: Int?
        let version: String?
        let titleLocalized: DifficultyTitleLocalized?
        let audioOverride: Bool?
        let bg: String?
        let plusFingers: Bool?
        let artist, bgInverse, bpm: String?
        let bpmBase: Int?
        let jacketNight: String?
        let hiddenUntilUnlocked: Bool?
        let hiddenUntil: HiddenUntil?
        let worldUnlock: Bool?

        enum CodingKeys: String, CodingKey {
            case ratingClass, chartDesigner, jacketDesigner, rating, jacketOverride, ratingPlus, date, version
            case titleLocalized = "title_localized"
            case audioOverride, bg, plusFingers, artist
            case bgInverse = "bg_inverse"
            case bpm
            case bpmBase = "bpm_base"
            case jacketNight = "jacket_night"
            case hiddenUntilUnlocked = "hidden_until_unlocked"
            case hiddenUntil = "hidden_until"
            case worldUnlock = "world_unlock"
        }
    }

    enum HiddenUntil: String, Codable {
        case always
        case difficulty
        case none
        case song
    }

    // MARK: - DifficultyTitleLocalized

    struct DifficultyTitleLocalized: Codable {
        let en: String
    }

    // MARK: - JacketLocalized

    struct JacketLocalized: Codable {
        let ja: Bool
    }

    // MARK: - SourceLocalized

    struct SourceLocalized: Codable {
        let en: String
        let ja: Ja?
    }

    enum Ja: String, Codable {
        case オンゲキ
        case グルヴコスタ = "グルーヴコースター"
    }

    // MARK: - SongTitleLocalized

    struct SongTitleLocalized: Codable {
        let en: String
        let ko, zhHant, zhHans, ja: String?
        let kr: String?

        enum CodingKeys: String, CodingKey {
            case en, ko
            case zhHant = "zh-Hant"
            case zhHans = "zh-Hans"
            case ja, kr
        }
    }
}

extension SongList.Song {
    var pst: SongList.Difficulty? {
        difficulties.first
    }

    var prs: SongList.Difficulty? {
        difficulties.dropFirst().first
    }

    var ftr: SongList.Difficulty? {
        difficulties.dropFirst(2).first
    }

    var byd: SongList.Difficulty? {
        difficulties.dropFirst(3).first
    }
}

extension SongList.Difficulty {
    var difficulty: Int {
        rating * 2 + (ratingPlus == true ? 1 : 0)
    }
}
