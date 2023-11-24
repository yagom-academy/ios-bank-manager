
struct BankManager {
    
    func giveWaitingTicketAndLineUp(customerNumber: Int, firstDepositLine: CustomerQueue<Customer>, secondDepositLine: CustomerQueue<Customer>, loanLine: CustomerQueue<Customer>) {
        for i in 1...customerNumber {
            let customer = Customer(waitingTicket: i, bankingCategory: BankingCategory.allCases.randomElement() ?? .deposit)
            
            guard customer.bankingCategory == .loan else {
                if secondDepositLine.hasCustomer < firstDepositLine.hasCustomer {
                    secondDepositLine.enqueue(customer: customer)
                } else {
                    firstDepositLine.enqueue(customer: customer)
                }
                continue
            }
            
            loanLine.enqueue(customer: customer)
        }
    }
}
