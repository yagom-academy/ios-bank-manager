import Foundation

struct Banker {
    var windowNumber: UInt
    var isWorking: Bool = false
}

struct Customer {
    var customerNumber: UInt
    var taskTime: Double
}

struct BankManager {
    private var bankers = [Banker]()
    private var customers = [Customer]()
    private var businessTimes: Double = 0.0
    private var visitedCustomers: UInt = 0
    
    mutating func configureBankers(numberOfBankers: UInt) {
        for window in 0..<numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: false))
        }
    }
}
