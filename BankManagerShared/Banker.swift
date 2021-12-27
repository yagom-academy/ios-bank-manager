import Foundation

protocol Banker {
    func task(of customer: Customer)
    var taskType: String { get }
    var taskTime: TimeInterval { get }
}

extension Banker {
    func task(of customer: Customer) {
        print("\(customer.customerNumber)번 고객 \(taskType)업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(customer.customerNumber)번 고객 \(taskType)업무 완료")
        BankManager.shared.increaseTotalCustomer()
    }
}

struct GeneralBanker: Banker {
    let taskType = ""
    let taskTime = 0.7
}
