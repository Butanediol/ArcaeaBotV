import Foundation

final class RelativeDateTimeFormatter {
	var locale = Locale(identifier: "en_US")
	var dateFormatter = DateFormatter()

	init() {}

	func fullLocalizedString(for date: Date, relativeTo referenceDate: Date) -> String {
		dateFormatter.locale = locale
		dateFormatter.dateStyle = .medium

		return dateFormatter.string(from: date)
	}

	func localizedString(for date: Date, relativeTo referenceDate: Date) -> String {
		var timeInterval = date.timeIntervalSince1970 - referenceDate.timeIntervalSince1970
		let indicator = timeInterval <= 0 ? "ago" : "after"

		timeInterval = abs(timeInterval)

		let month: Double = 2592000
		let day: Double = 86400
		let hour: Double = 3600
		let minute: Double = 60

		let months = floor(timeInterval / month)
		let days = floor((timeInterval - months * month) / day)
		let hours = floor((timeInterval - months * month - days * day) / hour)
		let minutes = floor((timeInterval - months * month - days * day - hours * hour) / minute)
		let seconds = timeInterval - months * month - days * day - hours * hour - minutes * minute

		if timeInterval >= month * 12 {
			return fullLocalizedString(for: date, relativeTo: referenceDate)
		} else if months != 0 {
			return String(format: "%.0f", months) + " month(s) \(indicator)"
		} else if days != 0 {
			return String(format: "%.0f", days) + " day(s) \(indicator)"
		} else if hours != 0 {
			return String(format: "%.0f", hours) + " hour(s) \(indicator)"
		} else if minutes != 0 {
			return String(format: "%.0f", minutes) + " minute(s) \(indicator)"
		} else {
			return String(format: "%.0f", seconds) + " second(s) \(indicator)"
		}
	}
}