extension StringProtocol {
    func toDifficulty() -> Difficulty? {
        switch self {
        case "pst", "past":
            return .past
        case "prs", "present":
            return .present
        case "ftr", "future":
            return .future
        case "byn", "byd", "beyond":
            return .beyond
        default:
            return nil
        }
    }
}
