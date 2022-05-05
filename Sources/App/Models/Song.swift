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
	var notesPst: Int?

	@Field(key: "notes_prs")
	var notesPrs: Int?

	@Field(key: "notes_ftr")
	var notesFtr: Int?

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
}

extension Song {
	func constant(of difficulty: Difficulty) -> Double {
		switch difficulty {
			case .past:
				return Double(self.ratingPst / 10)
			case .present:
				return Double(self.ratingPrs / 10)
			case .future:
				return Double(self.ratingFtr / 10)
			case .beyond:
				return Double((self.ratingByd ?? -1) / 10)
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