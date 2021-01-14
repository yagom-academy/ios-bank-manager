import Foundation

class Banker {
    private var windowNumber: UInt
    var isWorking: BankCondition {
        willSet {
            if newValue == .notWorking {
                doneWorking()
            }
        }
    }
    var customer: Customer?
    
    private let semaphore = DispatchSemaphore(value:0)
    
    init(windowNumber: UInt, isWorking: BankCondition) {
        self.windowNumber = windowNumber
        self.isWorking = isWorking
    }
    
    func work() {
        guard let customer = customer else {
            print("고객이 없습니다!")
            return
        }
        print("\(customer.waiting)번 \(customer.priority.describing)고객 \(customer.businessType.rawValue) 업무 시작")
        
        if customer.businessType == .loan {
            print("\(customer.waiting)번 \(customer.priority.describing)고객 대출서류 검토 시작")
            waitExamineLoan(customer)
            print("\(customer.waiting)번 \(customer.priority.describing)고객 대출서류 검토 완료")
        }
        semaphore.signal()
    }
    
    func waitExamineLoan(_ customer: Customer) {
        Thread.sleep(forTimeInterval: 0.3)
        DispatchQueue.global().sync {
            HeadOffice.main.examineLoan(customer)
        }
        Thread.sleep(forTimeInterval: 0.3)
    }
    
    func flipCondition() {
        switch isWorking {
        case .working:
            isWorking = .notWorking
        case .notWorking:
            isWorking = .working
        }
    }
    
    func doneWorking() {
        if let customer = customer {
            semaphore.wait()
            print("\(customer.waiting)번 \(customer.priority.describing)고객 \(customer.businessType.rawValue) 업무 종료")
        }
    }
}

struct Customer {
    enum Priority: Int, CaseIterable {
        case vvip = 0
        case vip = 1
        case normal = 2
        
        var describing: String {
            switch self {
            case .vvip:
                return "VVIP"
            case .vip:
                return "VIP"
            case .normal:
                return "일반"
            }
        }
    }
    var waiting: UInt
    var taskTime: Double
    var businessType: BusinessType
    var priority: Customer.Priority
}

class Bank {
    private var bankers = [Banker]()
    private var totalVistedCustomers: UInt = 0
    private var dispatchQueue = DispatchQueue.global()
    private var semaphore = DispatchSemaphore(value: 0)
    private let dispatchGroup = DispatchGroup()
    
    func configureBankers(numberOfBankers: UInt) {
        for window in 0..<numberOfBankers {
            bankers.append(Banker(windowNumber: window, isWorking: .notWorking))
        }
    }
    
    func openBank() {
        calculateTotalTime {
            while !customers.isEmpty {
                for windowNumber in 0..<bankers.count {
                    checkBankerIsWorking(windowNumber)
                }
            }
            checkEnd()
            semaphore.wait()
        }
        initializeInfo()
    }
    
    private func checkBankerIsWorking(_ windowNumber: Int) {
        let banker = bankers[windowNumber]
        switch banker.isWorking {
        case .notWorking:
            startCustomerTask(in: windowNumber)
        case .working:
            return
        }
    }
    
    private func startCustomerTask(in windowNumber: Int) {
        let banker = bankers[windowNumber]
        if let customer = customers.first {
            banker.flipCondition()
            dispatchGroup.enter()
            
            dispatchQueue.async {
                banker.customer = customer
                banker.work()
            }
            
            dispatchQueue.asyncAfter(deadline: .now() + customer.taskTime) {
                banker.flipCondition()
                self.dispatchGroup.leave()
            }
            totalVistedCustomers += 1
            customers.removeFirst()
        }
    }
    
    private func checkEnd() {
        dispatchGroup.notify(queue: dispatchQueue, execute: {
            self.semaphore.signal()
        })
    }
    
    private func initializeInfo() {
        bankers = [Banker]()
        customers = [Customer]()
        totalVistedCustomers = 0
    }
    
    private func calculateTotalTime(bankTaskFunction: () -> ()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankTaskFunction()
        let totalTime = CFAbsoluteTimeGetCurrent() - startTime
        
        let totalTimeToString: String = String(format: "%.2f", totalTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVistedCustomers)명이며, 총 업무시간은 \(totalTimeToString)초 입니다.")
    }
}
