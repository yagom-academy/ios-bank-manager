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

let bankManagerNumber = 1
var bank = Bank(bankManagerNumber: bankManagerNumber)

private func initializeBankCustomer() {
    let todayCustomerNumber = generateRandomNumberOfCustomer()
    bank.numberOfCustomer = todayCustomerNumber
    for waitNumber in 1...todayCustomerNumber {
        bank.customers.append(Customer(waitNumber: waitNumber))
    }
}

private func main() {
    var isConsoleAppTerminated: Bool = false
    
    while !isConsoleAppTerminated {
        print("\(ConsoleApp.menu)")
        
        switch getUserInput() {
        case ConsoleApp.start:
            initializeBankCustomer()
            bank.performBankTask()
        case ConsoleApp.exit:
            isConsoleAppTerminated = true
            break
        default:
            print(BankError.wrongUserInput.localizedDescription)
        }
    }
}

main()
