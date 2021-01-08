import Foundation

class Banker {
    var windowNumber: UInt
    var isWorking: BankCondition = .notWorking
    
    init(windowNumber: UInt, isWorking: BankCondition) {
        self.windowNumber = windowNumber
        self.isWorking = isWorking
    }
    
    func work(_ customers: Customer, _ bankers: Banker) {
        isWorking = .working
        print("\(bankers.windowNumber)번 창구에서 \(customers.waiting)번 \(customers.priority)고객 \(customers.businessType)업무 시작")
        
        Thread.sleep(forTimeInterval: customers.taskTime)
        
        print("\(bankers.windowNumber)번 창구에서 \(customers.waiting)번 \(customers.priority)고객 \(customers.businessType)업무 완료")
        isWorking = .notWorking
    }
}

struct Customer {
    var waiting: UInt
    var taskTime: Double
    var priority: CustomerPriority
    var businessType: BusinessType
}
    
class Bank {
    private var bankers = [Banker]()
    private var businessTimes: Double = 0.0
    private var visitedCustomers: UInt = 0
    
    let semaphore = DispatchSemaphore(value: 0)
    
    func configureBankers(numberOfBankers: UInt) {
        for window in 1...numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: .notWorking))
        }
    }
    
    func openBank() {
        while !customers.isEmpty {
            for banker in 0..<bankers.count {
                switch bankers[banker].isWorking {
                case .notWorking:
                    let customer = customers.removeFirst()
                    
                    bankers[banker].work(customer, self.bankers[banker])
                    
                    visitedCustomers += 1
                    businessTimes += customer.taskTime
                    
                case .working:
                    continue
                }
            }
        }
        sleep(2)
        closeBank()
        initializeInfo()
    }
    
    func closeBank() {
        let businessTimesToString: String = String(format: "%.2f", businessTimes)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(visitedCustomers)명이며, 총 업무시간은 \(businessTimesToString)초 입니다.")
    }
    
    func initializeInfo() {
        bankers = [Banker]()
        customers = [Customer]()
        businessTimes = 0.0
        visitedCustomers = 0
    }
}
