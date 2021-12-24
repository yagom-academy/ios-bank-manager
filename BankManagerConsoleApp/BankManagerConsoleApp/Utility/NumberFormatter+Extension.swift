import Foundation

extension NumberFormatter {
    static let centisecond: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
