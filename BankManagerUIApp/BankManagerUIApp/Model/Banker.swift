import Foundation

struct Banker {
    func work(for customer: Customer) {
        let banking = customer.banking
        print("\(customer.waitingNumber)번 고객 \(banking.description)업무 시작")
        Thread.sleep(forTimeInterval: banking.speed)
        print("\(customer.waitingNumber)번 고객 \(banking.description)업무 완료")
    }
}
