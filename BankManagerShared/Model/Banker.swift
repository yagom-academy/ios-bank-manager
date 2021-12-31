import Foundation

protocol Banker {
    static func task(of customer: Customer)
    static var taskType: TaskType { get }
    static var taskTime: TimeInterval { get }
}

extension Banker {
    static func task(of customer: Customer) {
        print("\(customer.customerNumber)번 고객 \(taskType.rawValue)업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(customer.customerNumber)번 고객 \(taskType.rawValue)업무 완료")
    }
}

enum DepositBanker: Banker {
    static let taskType = TaskType.deposit
    static let taskTime = 0.7
}

enum LoanBanker: Banker {
    static let taskType = TaskType.loan
    static let taskTime = 1.1
}
