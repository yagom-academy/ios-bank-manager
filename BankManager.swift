import Foundation

class Banker {
    private var windowNumber: UInt
    var isWorking: BankCondition {
        willSet {
            if newValue == .notWorking {
                workDone()
            }
        }
    }
    var customer: Customer?
    var workTime: Double
    
    init(windowNumber: UInt, isWorking: BankCondition) {
        self.windowNumber = windowNumber
        self.isWorking = isWorking
        workTime = 0.0
    }
    
    func work() {
        if let customer = customer {
            print("\(customer.waiting)번 \(customer.priority)고객 \(customer.businessType) 업무 시작")
            Thread.sleep(forTimeInterval: customer.taskTime)
            changeBankerCondition()
        }
    }
    
    func changeBankerCondition() {
        switch isWorking {
        case .working:
            isWorking = .notWorking
        case .notWorking:
            isWorking = .working
        }
    }
    
    private func workDone() {
        if let customer = customer {
            workTime += customer.taskTime
            print("\(customer.waiting)번 \(customer.priority)고객 \(customer.businessType) 업무 종료")
        }
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
    private var numberOfCustomers: UInt = 0
    private var dispatchQueue = DispatchQueue.global()
    private var semaphore = DispatchSemaphore(value: 0)
    
    func configureBankers(numberOfBankers: UInt) {
        for window in 0..<numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: .notWorking))
        }
    }
    
    func openBank() {
        while !customers.isEmpty {
            for windowNumber in 0..<bankers.count {
                checkBankerIsWorking(windowNumber)
            }
        }
        checkEnd()
        semaphore.wait()
        closeBank()
        initializeInfo()
    }
    
    private func checkBankerIsWorking(_windowNumber: Int) {
        let banker = bankers[windowNumber]
        switch banker.isWorking {
            case .notWorking:
                banker.changeBankerCondition()
                if let customer = customers.first {
                    dispatchQueue.async {
                        banker.customer = customer
                        banker.work()
                    }
                    numberOfCustomers += 1
                    customers.removeFirst()
                }
            case .working:
                return
        }
    }
    
    
    
    

