import Foundation

struct ScoreResponse: Codable {
	let bestPlay: Play

    enum CodingKeys: String, CodingKey {
        case bestPlay = "data"
    }
}