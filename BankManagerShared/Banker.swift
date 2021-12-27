import Foundation

protocol Banker {
    func task(of customer: Customer)
    var taskType: String { get }
}

extension Banker {
    func task(of customer: Customer) {
        print("\(customer.customerNumber)번 고객 \(taskType)업무 시작")
        print("\(customer.customerNumber)번 고객 \(taskType)업무 완료")
    }
}

struct GeneralBanker: Banker {
    let taskType = ""
}
