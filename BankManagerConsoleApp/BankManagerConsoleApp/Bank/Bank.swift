//
//  Bank.swift
//  BankManagerConsoleApp

import Foundation

struct Bank: Bankable, Depositable, Loanable {
    let depositDepartment: Department
    let loanDepartment: Department
    var waitingLine: Queue<Customer> = Queue()
    var handledCustomerCount: Int = 0
    let bankingServiceGroup: DispatchGroup = DispatchGroup()

    init(depositClerks: Int, loanClerks: Int) {
        self.depositDepartment = Department(service: .deposit, numberOfClerks: depositClerks)
        self.loanDepartment = Department(service: .loan, numberOfClerks: loanClerks)
    }
    
    mutating func allocateCustomer() {
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
