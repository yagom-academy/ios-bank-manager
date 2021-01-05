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
    private let taskTime: Double = 0.7
    
    mutating func configureBankers(numberOfBankers: UInt) {
        for window in 0..<numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: false))
        }
    }
    
    mutating func configureCustomers(numberOfCustomers: UInt) {
        for customer in 0..<numberOfCustomers {
            customers.append(Customer(customerNumber: customer, taskTime: taskTime))
        }
    }
}
