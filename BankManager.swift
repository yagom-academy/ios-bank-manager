import Foundation

struct BankManager {
    func work(for customer: Customer, time: Double) {
        print("\(customer.number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: time)
        print("\(customer.number)번 고객 업무 완료")
    }
}
