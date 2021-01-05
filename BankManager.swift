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
    
    mutating func openBank() {
        while !customers.isEmpty {
            for window in 0..<bankers.count {
                bankers[window].isWorking = true
                if let customer = customers.first {
                    print("\(customer.customerNumber)번 고객 업무 시작")
                }
            }
            for window in 0..<bankers.count {
                bankers[window].isWorking = false
                print("\(customers.removeFirst().customerNumber)번 고객 업무 완료")
                visitedCustomers += 1
            }
        }
    }
}
