import Foundation

struct Teller {
    func work(for customer: Customer) {
        guard let task = customer.taskType else {
            return
        }
        
        print("\(customer.number)번 고객 \(task) 시작")
        Thread.sleep(forTimeInterval: task.workTime)
        print("\(customer.number)번 고객 \(task) 완료")
    }
}
