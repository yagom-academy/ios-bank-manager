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

var todayCustomerNumber = generateRandomNumberOfCustomer()
let bankManagerNumber = 1
var bank = Bank(customerNumber: todayCustomerNumber, bankManagerNumber: bankManagerNumber)
var firstTimeBankOpen: Bool = true

private func main() {
    while bank.isBankOpen {
        print(BankMenu.Menu)
        
        if !firstTimeBankOpen {
            todayCustomerNumber = generateRandomNumberOfCustomer()
            bank.initializeCustomers(customerNumber: todayCustomerNumber)
            bank.initializeBankManagers(bankManagerNumber: bankManagerNumber)
        }
        
        firstTimeBankOpen = false
        
        switch getUserInput() {
        case BankMenu.start:
            bank.performBankTask()
            bank.printFinishBank()
            bank.resetBank()
        case BankMenu.exit:
            bank.isBankOpen = false
            break
        default:
            guard let message = BankError.wrongUserInput.errorDescription else {
                return
            }
            print(message)
        }
    }
}

main()
