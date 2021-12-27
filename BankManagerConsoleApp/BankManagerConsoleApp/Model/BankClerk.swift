import Foundation

struct BankClerk {
    func handleTask(of customer: Customer, until taskTime: Double) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(customer.waitingNumber)번 고객 업무 종료")
    }
}
