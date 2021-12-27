import Foundation

struct BankClerk {
    func handleTask(of customer: Customer, until taskTime: Double) {
        guard let task = customer.task?.name else {
            return
        }
        
        print("\(customer.waitingNumber)번 고객 \(task)업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(customer.waitingNumber)번 고객 \(task)업무 종료")
    }
}
