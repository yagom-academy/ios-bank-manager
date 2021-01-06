import Foundation

struct Banker {
    var windowNumber: UInt
    var isWorking: Bool = false
}

struct Customer {
    var waiting: UInt
    var taskTime: Double
}

struct Bank {
    private var bankers = [Banker]()
    private var customers = [Customer]()
    private var businessTimes: Double = 0.0
    private var visitedCustomers: UInt = 0
    private let taskTime: Double = 0.7
    
    mutating func configureBankers(numberOfBankers: UInt) {
        for window in 1...numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: false))
        }
    }
    
    mutating func configureCustomers(numberOfCustomers: UInt) {
        for number in 1...numberOfCustomers {
            customers.append(Customer(waiting: number, taskTime: taskTime))
        }
    }
    
    mutating func openBank() {
        while !customers.isEmpty {
            for window in 0..<bankers.count {
                bankers[window].isWorking = true
                if let customer = customers.first {
                    print("\(customer.waiting)번 고객 업무 시작")

                bankers[window].isWorking = false
                print("\(customers.removeFirst().waiting)번 고객 업무 완료")
                visitedCustomers += 1
                }
            }
            businessTimes += taskTime
        }
        closeBank()
        initializeInfo()
    }
    
    func closeBank() {
        let businessTimesToString: String = String(format: "%.2f", businessTimes)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(visitedCustomers)명이며, 총 업무시간은 \(businessTimesToString)초 업니다.")
    }
    
    mutating func initializeInfo() {
        bankers = [Banker]()
        customers = [Customer]()
        businessTimes = 0.0
        visitedCustomers = 0
    }
}
