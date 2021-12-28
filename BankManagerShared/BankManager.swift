import Foundation

struct BankManager {
    var totalTime: TimeInterval = 0
    var totalCustomer: Int = 0
    
    mutating func startTimeCheck() {
        totalTime -= Date().timeIntervalSinceReferenceDate
    }
    
    mutating func endTimeCheck() {
        totalTime += Date().timeIntervalSinceReferenceDate
    }
    
    mutating func increaseTotalCustomer() {
        self.totalCustomer += 1
    }
    
    mutating func clearTotalValues() {
        self.totalTime = 0
    }
}
