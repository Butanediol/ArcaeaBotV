import Foundation

extension String {
	var markdownV2Escaped: String {
		var escaped = self
		["_", "[", "]", "(", ")", "~", ">", "#", "+", "-", "=", "|", "{", "}", ".", "!"]
			.forEach { char in
				escaped = escaped.replacingOccurrences(of: char, with: "\\\(char)")
			}
		return escaped
	}
}