import Foundation

public struct BankManager<BankClerk: CustomerReceivable> {
    private let customerQueue = CustomerQueue<CustomerNumbering>(list: LinkedList<CustomerNumbering>())
    
    public init() { }
    
    public func standBy(customer: CustomerNumbering) {
        customerQueue.enqueue(customer)
    }
    
    public func assignCustomer(to bankClerk: [Banking: BankClerk]) {
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 2)
        let depositQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
        let loanQeueue = DispatchQueue(label: "loanQueue")
        
        while let customer = customerQueue.dequeue() as? BankClerk.Customer,
              let banking = customer.banking {
            switch banking {
            case .deposit:
                depositQueue.async(group: group) {
                    semaphore.wait()
                    bankClerk[banking]?.receive(customer: customer)
                    semaphore.signal()
                }
            case .loan:
                loanQeueue.async(group: group) {
                    bankClerk[banking]?.receive(customer: customer)
                }
            }
        }
        
        group.wait()
    }
}
