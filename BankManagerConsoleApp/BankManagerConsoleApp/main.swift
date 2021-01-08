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

private func generateRandomCustomerPriority() -> CustomerPriority {
    let priority = Int.random(in: 0...2)
    switch priority {
    case Int(CustomerPriority.vvip.rawValue):
        return .vvip
    case Int(CustomerPriority.vip.rawValue):
        return .vip
    default:
        return .normal
    }
}

private func generateRandomCustomerTask() -> CustomerTask {
    let taskType = Int.random(in: 0...1)
    switch taskType {
    case Int(CustomerTask.loan.rawValue):
        return .loan
    default:
        return .deposit
    }
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
        let customerPriority = generateRandomCustomerPriority()
        let customerTask = generateRandomCustomerTask()
        bank.customers.append(Customer(waitNumber: waitNumber, priority: customerPriority, taskType: customerTask))
    }
    
    bank.customers.sort { (currentCustomer, nextCustomer) -> Bool in
        currentCustomer.priority.rawValue < nextCustomer.priority.rawValue
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
