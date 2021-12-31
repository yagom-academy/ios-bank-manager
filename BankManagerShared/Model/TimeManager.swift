import Foundation

class TimeManager {
    var totalTime: TimeInterval = 0
    
    func startTimeCheck() {
        totalTime -= Date().timeIntervalSinceReferenceDate
    }
    
    func endTimeCheck() {
        totalTime += Date().timeIntervalSinceReferenceDate
    }
}
