import Foundation

struct BankClerk {
    private let handleTaskTime = 0.7
    
    func handleTask(of customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: handleTaskTime)
        print("\(customer.waitingNumber)번 고객 업무 종료")
    }
}
