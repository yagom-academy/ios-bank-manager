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
    var workTime: Double
    
    private let semaphore = DispatchSemaphore(value:0)
    
    init(windowNumber: UInt, isWorking: BankCondition) {
        self.windowNumber = windowNumber
        self.isWorking = isWorking
        workTime = 0.0
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
        Thread.sleep(forTimeInterval: customer.taskTime)
        DispatchQueue.global().sync {
            HeadOffice.main.examineLoan(customer)
        }
        Thread.sleep(forTimeInterval: customer.taskTime)
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
            workTime += customer.taskTime
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
    private var businessTimes: Double = 0.0
    private var totalVistdCustomers: UInt = 0
    private var dispatchQueue = DispatchQueue.global()
    private var semaphore = DispatchSemaphore(value: 0)
    private let dispatchGroup = DispatchGroup()
    
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
            totalVistdCustomers += 1
            customers.removeFirst()
        }
    }
    
    private func checkEnd() {
        dispatchGroup.notify(queue: dispatchQueue, execute: {
            self.decideTotalTime()
        })
    }

    
    private func decideTotalTime() {
        bankers.sort { $0.workTime > $1.workTime }
        businessTimes = bankers[0].workTime
        semaphore.signal()
    }
    
    private func closeBank() {
        let businessTimeToString: String = String(format: "%.2f", businessTimes)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVistdCustomers)명이며, 총 업무시간은 \(businessTimeToString)초 입니다.")
    }
    
    private func initializeInfo() {
        bankers = [Banker]()
        customers = [Customer]()
        businessTimes = 0.0
        totalVistdCustomers = 0
    }
}
