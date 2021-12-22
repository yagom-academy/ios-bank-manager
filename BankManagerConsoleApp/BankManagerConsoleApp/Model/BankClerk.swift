import Foundation

struct BankClerk {
    func work(_ waitingLine: inout Queue<Customer>) {
        guard let customer = waitingLine.dequeue() else {
            return
        }
        
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.waitingNumber)번 고객 업무 종료")
    }
}
