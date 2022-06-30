import Foundation

struct BankManager {
    private var customer: Customer

    init(customer: Customer) {
        self.customer = customer
    }
    
    func work() {
        print("(customer.name) 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("(customer.name) 고객 업무 완료")
    }
}
