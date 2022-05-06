extension StringProtocol {
	func toDifficulty(defaultDifficulty: Difficulty = .future) -> Difficulty {
		var difficulty: Difficulty = defaultDifficulty
		switch self {
		    case "pst", "past":
		        difficulty = .past
		    case "prs", "present":
		        difficulty = .present
		    case "ftr", "future":
		        difficulty = .future
		    case "byn", "byd", "beyond":
		        difficulty = .beyond
		    default:
		        break
		}
		return difficulty
	}
}