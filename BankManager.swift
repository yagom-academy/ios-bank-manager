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
    
    
    
    

