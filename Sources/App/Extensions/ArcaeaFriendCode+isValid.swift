extension ArcaeaFriendCode {
	var isValid: Bool {

		// Length must be 9
		guard self.count == 9 else { return false }

		// Must be number
		guard let number = Int(self) else { return false }

		// Must be positive
		guard number > 0 else { return false }

		return true
	}
}