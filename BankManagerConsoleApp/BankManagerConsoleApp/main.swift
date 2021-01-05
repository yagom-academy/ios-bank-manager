//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private func generateRandomNumberOfCustomer() -> Int {
    let randomNumber = Int.random(in: 10...30)
    return randomNumber
}

private func getUserInput() -> String {
    guard let input = readLine() else {
        return BankError.noEnterFromUser.localizedDescription
    }
    return input
}

private func setUpCustomer() -> [Customer] {
    let todayCustomerNumber = generateRandomNumberOfCustomer()
    var customers: [Customer] = []
    for index in 1...todayCustomerNumber {
        customers.append(Customer(waitNumber: index))
    }
    return customers
}

private func performBankTask() {
    let bankManager = BankManager(number: 1)
    let customers = setUpCustomer()
    let bank = Bank(customer: customers, bankManager: [bankManager])
    
    for index in 1...bank.numberOfCustomer {
        bankManager.printStartTask(customerNumber: index)
        bankManager.printFinishTask(customerNumber: index)
    }
    bank.printFinishBank()
}

private func openBank() {
    print(BankMenu.Menu)
    
    switch getUserInput() {
    case BankMenu.start:
        performBankTask()
        openBank()
    case BankMenu.exit:
        return
    default:
        guard let message = BankError.wrongUserInput.errorDescription else {
            fatalError()
        }
        print(message)
        openBank()
    }
}

openBank()
