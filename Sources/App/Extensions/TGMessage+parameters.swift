import TelegramVaporBot

extension TGMessage {
    var parameters: [String] {
        if var text = text {
            entities?
                .filter { $0.type == .botCommand }
                .forEach { command in
                    let startOfCommand = text.index(text.startIndex, offsetBy: command.offset)
                    let endOfCommand = text.index(text.startIndex, offsetBy: command.offset + command.length)
                    text.removeSubrange(startOfCommand ..< endOfCommand)
                }

            return text.split(separator: " ").map { String($0) }

        } else {
            return []
        }
    }
}
