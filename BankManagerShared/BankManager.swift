import Foundation

class BankManager {
    var totalTime: TimeInterval = 0
    var totalCustomer: Int = 0
    
    func startTimeCheck() {
        totalTime -= Date().timeIntervalSinceReferenceDate
    }
    
    func endTimeCheck() {
        totalTime += Date().timeIntervalSinceReferenceDate
    }
    
    func increaseTotalCustomer() {
        self.totalCustomer += 1
    }
    
    func clearTotalValues() {
        self.totalTime = 0
    }
}
