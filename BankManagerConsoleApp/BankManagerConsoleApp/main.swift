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

private func generateRandomCustomerPriority() -> Customer.Priority {
    let priority = Customer.Priority.allCases.randomElement() ?? .normal
    return priority
}

private func generateRandomCustomerTask() -> Customer.Task {
    let taskType = Customer.Task.allCases.randomElement() ?? .deposit
    return taskType
}

private func getUserInput() -> String {
    guard let input = readLine() else {
        return BankError.noEnterFromUser.localizedDescription
    }
    return input
}

private let bankManagerNumber = 3
private let bank = Bank(bankManagerNumber: bankManagerNumber)

private func initializeBankCustomer() {
    let todayCustomerNumber = generateRandomNumberOfCustomer()
    bank.customerTotalCount = todayCustomerNumber
    for waitNumber in 1...todayCustomerNumber {
        let customerPriority = generateRandomCustomerPriority()
        let customerTask = generateRandomCustomerTask()
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
        print("\(ConsoleApp.menu)")
        print("입력 : ", terminator: "")
        
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
