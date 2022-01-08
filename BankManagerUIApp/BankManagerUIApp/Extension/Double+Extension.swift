import Foundation

extension Double {
    var convertedTime: String {
        var time = self
        let minute = Int(time / 60)
        time -= Double(minute * 60)
        let second = Int(time * 10 / 10)
        let milisecond = Int(time.truncatingRemainder(dividingBy: 1) * 1000 / 1)
        
        return String(format: "%.2d:%.2d:%.3d", minute, second, milisecond)
    }
    
    func roundedOffDescription(for maximumFractionDigits: Int) -> String {
        return String(format: "%.\(maximumFractionDigits)f", self)
    }
}
