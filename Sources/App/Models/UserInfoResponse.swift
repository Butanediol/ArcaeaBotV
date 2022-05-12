import Fluent
import Vapor

protocol UserInfoProtocol {
    var potential: Int? { get }
    var displayName: String { get }
}

// MARK: - UserInfoResponse

struct UserInfoResponse: Codable {
    let userInfo: UserInfo

    enum CodingKeys: String, CodingKey {
        case userInfo = "data"
    }
}

// MARK: - Partner

struct Partner: Codable {
    let partnerID: Int
    let isAwakened: Bool

    enum CodingKeys: String, CodingKey {
        case partnerID = "partner_id"
        case isAwakened = "is_awakened"
    }
}
