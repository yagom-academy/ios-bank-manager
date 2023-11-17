import Foundation

public struct BankManager<BankClerk: CustomerReceivable> {
    private let customerQueue = CustomerQueue<CustomerNumbering>(list: LinkedList<CustomerNumbering>())
    
    public init() { }
    
    public func standBy(customer: CustomerNumbering) {
        customerQueue.enqueue(customer)
    }
    
    public func assignCustomer(to bankClerk: BankClerk) {
        while let customer = customerQueue.dequeue() as? BankClerk.Customer {
            bankClerk.receive(customer: customer) { number, pace in
                print("\(number)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: pace)
                print("\(number)번 고객 업무 종료")
            }
        }
    }
}
