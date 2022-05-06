import Foundation

extension Double {
    func formatString(withDigits digits: Int) -> String {
        String(format: "%.\(digits)f", self)
    }
}
