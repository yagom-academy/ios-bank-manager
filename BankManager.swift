import Foundation

struct BankManager {
    func work(customer: Customer, time: TimeInterval) {
        print("\(customer.name) 고객 업무 시작")
        Thread.sleep(forTimeInterval: time)
        print("\(customer.name) 고객 업무 완료")
    }
}
