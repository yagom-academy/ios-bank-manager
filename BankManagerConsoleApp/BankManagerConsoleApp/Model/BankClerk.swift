import Foundation

struct BankClerk {
    func handleTask(of customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.waitingNumber)번 고객 업무 종료")
    }
}
