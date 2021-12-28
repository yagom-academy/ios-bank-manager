import Foundation

struct Banker {
    private func workSpeed(_ banking: Banking) -> TimeInterval {
        return banking.speed
    }
    
    func work(for customer: Customer) {
        let banking = customer.banking
        print("\(customer.waitingNumber)번 고객 \(banking.description)업무 시작")
        Thread.sleep(forTimeInterval: workSpeed(customer.banking))
        print("\(customer.waitingNumber)번 고객 \(banking.description)업무 완료")
    }
}
