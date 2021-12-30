import Foundation

protocol Banker {
    func task(of customer: Customer)
    var taskType: TaskType { get }
    var taskTime: TimeInterval { get }
}

extension Banker {
    func task(of customer: Customer) {
        print("\(customer.customerNumber)번 고객 \(taskType)업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(customer.customerNumber)번 고객 \(taskType)업무 완료")
    }
}

struct DepositBanker: Banker {
     let taskType = TaskType.deposit
     let taskTime = 0.7
}

 struct LoanBanker: Banker {
     let taskType = TaskType.loan
     let taskTime = 1.1
}
