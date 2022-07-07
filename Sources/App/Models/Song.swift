import Fluent
import Vapor

final class Song: Model, Content {
    static let schema = "songs"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "sid")
    var sid: String

    @Field(key: "name_en")
    var nameEn: String

    @Field(key: "name_jp")
    var nameJp: String?

    @Field(key: "bpm")
    var bpm: String

    @Field(key: "bpm_base")
    var bpmBase: Int

    @Field(key: "packset")
    var packset: String

    @Field(key: "artist")
    var artist: String

    @Field(key: "time")
    var time: Int

    @Field(key: "side")
    var side: Int

    @Field(key: "date")
    var date: Double

    @Field(key: "version")
    var version: String

    @Field(key: "world_unlock")
    var worldUnlock: Bool

    @Field(key: "remote_download")
    var remoteDownload: Bool

    @Field(key: "rating_pst")
    var ratingPst: Int

    @Field(key: "rating_prs")
    var ratingPrs: Int

    @Field(key: "rating_ftr")
    var ratingFtr: Int

    @Field(key: "rating_byd")
    var ratingByd: Int?

    @Field(key: "difficulty_pst")
    var difficultyPst: Int

    @Field(key: "difficulty_prs")
    var difficultyPrs: Int

    @Field(key: "difficulty_ftr")
    var difficultyFtr: Int

    @Field(key: "difficulty_byd")
    var difficultyByd: Int?

    @Field(key: "notes_pst")
    var notesPst: Int

    @Field(key: "notes_prs")
    var notesPrs: Int

    @Field(key: "notes_ftr")
    var notesFtr: Int

    @Field(key: "notes_byd")
    var notesByd: Int

    @Field(key: "chart_designer_pst")
    var chartDesignerPst: String

    @Field(key: "chart_designer_prs")
    var chartDesignerPrs: String

    @Field(key: "chart_designer_ftr")
    var chartDesignerFtr: String

    @Field(key: "chart_designer_byd")
    var chartDesignerByd: String?

    @Field(key: "jacket_designer_pst")
    var jacketDesignerPst: String

    @Field(key: "jacket_designer_prs")
    var jacketDesignerPrs: String

    @Field(key: "jacket_designer_ftr")
    var jacketDesignerFtr: String

    @Field(key: "jacket_designer_byd")
    var jacketDesignerByd: String?

    @Field(key: "jacket_override_pst")
    var jacketOverridePst: Bool

    @Field(key: "jacket_override_prs")
    var jacketOverridePrs: Bool

    @Field(key: "jacket_override_ftr")
    var jacketOverrideFtr: Bool

    @Field(key: "jacket_override_byd")
    var jacketOverrideByd: Bool?

    init() {}

    init(
        sid: String,
        nameEn: String,
        nameJp: String? = nil,
        bpm: String,
        bpmBase: Int,
        packset: String,
        artist: String,
        time: Int? = nil,
        side: Int,
        date: Double,
        version: String,
        worldUnlock: Bool,
        remoteDownload: Bool,
        ratingPst: Int? = nil,
        ratingPrs: Int? = nil,
        ratingFtr: Int? = nil,
        ratingByd: Int? = nil,
        difficultyPst: Int,
        difficultyPrs: Int,
        difficultyFtr: Int,
        difficultyByd: Int? = nil,
        notesPst: Int? = nil,
        notesPrs: Int? = nil,
        notesFtr: Int? = nil,
        notesByd: Int? = nil,
        chartDesignerPst: String? = nil,
        chartDesignerPrs: String? = nil,
        chartDesignerFtr: String? = nil,
        chartDesignerByd: String? = nil,
        jacketDesignerPst: String? = nil,
        jacketDesignerPrs: String? = nil,
        jacketDesignerFtr: String? = nil,
        jacketDesignerByd: String? = nil,
        jacketOverridePst: Bool? = nil,
        jacketOverridePrs: Bool? = nil,
        jacketOverrideFtr: Bool? = nil,
        jacketOverrideByd: Bool? = nil
    ) {
        id = UUID()
        self.sid = sid
        self.nameEn = nameEn
        self.nameJp = nameJp
        self.bpm = bpm
        self.bpmBase = bpmBase
        self.packset = packset
        self.artist = artist
        self.time = time ?? 0
        self.side = side
        self.date = date
        self.version = version
        self.worldUnlock = worldUnlock
        self.remoteDownload = remoteDownload
        self.ratingPst = ratingPst ?? 0
        self.ratingPrs = ratingPrs ?? 0
        self.ratingFtr = ratingFtr ?? 0
        self.ratingByd = ratingByd ?? 0
        self.difficultyPst = difficultyPst
        self.difficultyPrs = difficultyPrs
        self.difficultyFtr = difficultyFtr
        self.difficultyByd = difficultyByd
        self.notesPst = notesPst ?? 0
        self.notesPrs = notesPrs ?? 0
        self.notesFtr = notesFtr ?? 0
        self.notesByd = notesByd ?? 0
        self.chartDesignerPst = chartDesignerPst ?? ""
        self.chartDesignerPrs = chartDesignerPrs ?? ""
        self.chartDesignerFtr = chartDesignerFtr ?? ""
        self.chartDesignerByd = chartDesignerByd
        self.jacketDesignerPst = jacketDesignerPst ?? ""
        self.jacketDesignerPrs = jacketDesignerPrs ?? ""
        self.jacketDesignerFtr = jacketDesignerFtr ?? ""
        self.jacketDesignerByd = jacketDesignerByd
        self.jacketOverridePst = jacketOverridePst ?? false
        self.jacketOverridePrs = jacketOverridePrs ?? false
        self.jacketOverrideFtr = jacketOverrideFtr ?? false
        self.jacketOverrideByd = jacketOverrideByd
    }
}

extension Song {
    func constant(of difficulty: Difficulty) -> Double {
        switch difficulty {
        case .past:
            return Double(ratingPst) / 10
        case .present:
            return Double(ratingPrs) / 10
        case .future:
            return Double(ratingFtr) / 10
        case .beyond:
            return Double(ratingByd ?? -1) / 10
        }
    }

    func playPtt(difficulty: Difficulty, score: Int) -> Double {
        let constant = constant(of: difficulty)

        if score >= 10_000_000 {
            return constant + 2
        } else if score >= 9_800_800 {
            return constant + 1 + Double(score - 9_800_000) / 200_000
        } else {
            return max(constant + Double(score - 9_500_000) / 300_000, 0)
        }
    }
}
