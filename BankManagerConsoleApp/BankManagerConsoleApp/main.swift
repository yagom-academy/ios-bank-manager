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
        return StringFormattingError.noEnterFromUser.localizedDescription
    }
    return input
}

private let bankManagerNumber = 3
private let bank = Bank(bankManagerNumber: bankManagerNumber)

private func initializeBankCustomer() {
    let todayCustomerNumber = generateRandomNumberOfCustomer()
    bank.customerTotalCount = todayCustomerNumber
    for waitNumber in 1...todayCustomerNumber {
        guard let customerPriority = Customer.Priority.allCases.randomElement(), let customerTask = Customer.Task.allCases.randomElement() else {
            print(StringFormattingError.unknown.localizedDescription)
            return
        }
        bank.customers.append(Customer(waitNumber: waitNumber, priority: customerPriority, taskType: customerTask))
    }
    
    bank.customers.sort { (currentCustomer, nextCustomer) -> Bool in
        if currentCustomer.priority.rawValue == nextCustomer.priority.rawValue {
            return currentCustomer.waitNumber < nextCustomer.waitNumber
        }
        return currentCustomer.priority.rawValue < nextCustomer.priority.rawValue
    }
}

private func main() {
    var isConsoleAppTerminated: Bool = false
    
    while !isConsoleAppTerminated {
        print("\(ConsoleApp.menu)",terminator : "")
        
        switch getUserInput() {
        case ConsoleApp.start:
            initializeBankCustomer()
            bank.performBankTask()
        case ConsoleApp.exit:
            isConsoleAppTerminated = true
            break
        default:
            print(StringFormattingError.wrongUserInput.localizedDescription)
        }
    }
}

main()
