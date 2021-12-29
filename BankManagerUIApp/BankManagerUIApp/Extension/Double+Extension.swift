import Foundation

extension Double {
    func roundedOffDescription(for maximumFractionDigits: Int) -> String {
        return String(format: "%.\(maximumFractionDigits)f", self)
    }
}
