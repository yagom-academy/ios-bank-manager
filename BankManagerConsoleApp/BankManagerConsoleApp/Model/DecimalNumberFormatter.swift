import Foundation

enum DecimalNumberFormatter {
    static func string(for obj: Any?) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .halfUp
        let totalTime = formatter.string(for: obj)
        return totalTime
    }
}
