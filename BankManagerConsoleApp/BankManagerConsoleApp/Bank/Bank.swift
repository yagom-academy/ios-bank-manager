//
//  Bank.swift
//  BankManagerConsoleApp

import Foundation

final class Bank: Bankable, Depositable, Loanable {
    var depositDepartment: DepositDepartment
    var loanDepartment: LoanDepartment
    var waitingLine: Queue<Customer> = Queue()
    var handledCustomerCount: Int = 0
    var bankingServiceGroup: DispatchGroup = DispatchGroup()

    init(depositClerks: Int, loanClerks: Int) {
        self.depositDepartment = DepositDepartment(numberOfClerks: depositClerks)
        self.loanDepartment = LoanDepartment(numberOfClerks: loanClerks)
    }
    
    func allocateCustomer() {
        guard let customer = waitingLine.dequeue() else { return }
        
        switch customer.banking {
        case .deposit:
            depositDepartment.handleCustomer(customer, dispatchGroup: bankingServiceGroup)
        case .loan:
            loanDepartment.handleCustomer(customer, dispatchGroup: bankingServiceGroup)
        }
        
        handledCustomerCount += 1
    }
}
