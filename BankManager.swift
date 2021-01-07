import Foundation

enum BankCondition {
    case working
    case notWorking
}

struct Banker {
    var windowNumber: UInt
    var isWorking: BankCondition = .notWorking
    mutating func work(_ customers: Customer) {
        isWorking = .working
        print("\(customers.waiting)번 고객 업무 시작")
        print("\(customers.waiting)번 고객 업무 완료")
        isWorking = .notWorking
    }
}
    
struct Customer {
    var waiting: UInt
    var taskTime: Double
}
    
struct Bank {
    
    private var bankers = [Banker]()
    private var businessTimes: Double = 0.0
    private var visitedCustomers: UInt = 0

    mutating func configureBankers(numberOfBankers: UInt) {
        for window in 1...numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: .notWorking))
        }
    }

    mutating func openBank() {
        while !customers.isEmpty {
            for banker in 0..<bankers.count {
                switch bankers[banker].isWorking {
                case .notWorking:
                    bankers[banker].work(customers.removeFirst())
                    visitedCustomers += 1
                    businessTimes += taskTime
                case .working:
                    continue
                }
            }
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
