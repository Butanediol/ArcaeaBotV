import Foundation

// MARK: Difficulty
enum Difficulty: Int, Codable {
    case past = 0, present, future, beyond

    var abbr: String {
        switch self {
            case .past: return "pst"
            case .present: return "prs"
            case .future: return "ftr"
            case .beyond: return "byd"
        }
    }

    var fullName: String {
        switch self {
            case .past: return "Past"
            case .present: return "Present"
            case .future: return "Future"
            case .beyond: return "Beyond"
        }
    }
}