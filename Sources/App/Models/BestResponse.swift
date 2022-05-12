import Fluent
import Vapor

typealias Best30 = [Play]

struct Best30Response: Codable {
    let best30: Best30

    enum CodingKeys: String, CodingKey {
        case best30 = "data"
    }
}
