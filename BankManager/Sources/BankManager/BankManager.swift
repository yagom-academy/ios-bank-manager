
struct BankManager {
    
    func giveWaitingTicketAndLineUp(customerNumber: Int, depositLine: CustomerQueue<Customer>, loanLine: CustomerQueue<Customer>) {
        for i in 1...customerNumber {
            let customer = Customer(
                waitingTicket: i,
                bankingCategory: BankingCategory.allCases.randomElement() ?? .deposit
            )

            if customer.bankingCategory == .loan {
                loanLine.enqueue(customer)
            } else {
                depositLine.enqueue(customer)
            }
            
            switch customer.bankingCategory {
            case .deposit:
                depositLine.enqueue(customer)
            case .loan:
                loanLine.enqueue(customer)
            }
        }
    }
}
