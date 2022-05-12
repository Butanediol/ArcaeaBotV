import Foundation

extension PlayProtocol {
    /// This property is the relative date of this play record.
    var relativeTime: String {
        let playDate = Date(timeIntervalSince1970: Double(timePlayed / 1000))

        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "en_US")
        return formatter.localizedString(for: playDate, relativeTo: Date())
    }
}
