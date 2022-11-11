//
//  main.swift
//  BankManagerConsoleApp

import Foundation

let bank: Bank = Bank(depositClerks: 2, loanClerks: 1)
var bankManager: BankManager = BankManager(bank: bank)

while bankManager.isRunning {
    do {
        let customers = try createCustomers()
        try bankManager.run(customers)
    } catch {
        if let error = error as? BankError {
            print(error.localizedDescription)
        }
    }
}

func createCustomers() throws -> [Customer] {
    var customers: [Customer] = []
    let totalCustomerCount: Int = Int.random(in: Constant.customerNumberRange)
    
    for number in 1..<totalCustomerCount {
        guard let banking: BankService = BankService.allCases.randomElement() else {
            throw BankError.invalidService
        }
        
        let customer: Customer = Customer(waitingNumber: number, banking: banking)
        customers.append(customer)
    }
    
    return customers
}
