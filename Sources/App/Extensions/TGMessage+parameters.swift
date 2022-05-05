import telegram_vapor_bot

extension TGMessage {
	var parameters: [String] {

		if var text = self.text {

			self.entities?
				.filter { $0.type == .botCommand }
				.forEach { command in
					let startOfCommand = text.index(text.startIndex, offsetBy: command.offset)
					let endOfCommand = text.index(text.startIndex, offsetBy: command.offset + command.length)
					text.removeSubrange(startOfCommand..<endOfCommand)
				}

			return text.split(separator: " ").map { String($0) }
			
		} else {
			return []
		}
	}
}