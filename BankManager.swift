//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BankState: Int {
    case open = 1
    case close = 2
}

struct BankManager {
    private var bankState: Int = 0
    
    mutating func openBank() {
        repeat {
            let userInput = getInput()
            self.bankState = userInput
            let customers = countTodayCustomer()
            
            if self.bankState == BankState.open.rawValue {
                let taskedTime = BankClerk().serveCustomers(customers: customers)
                MessageCollection.printCloseBankText(customers: customers, taskedTime: Double(taskedTime))
            }
        } while self.bankState == BankState.open.rawValue
    }
}

func countTodayCustomer() -> Int {
    let customers = Int.random(in: 10...30)
    return customers
}

func getInput() -> Int {
    print(MessageCollection.initializationText, terminator: "")
    guard let userInput: String = readLine(), let userInputNumber: Int = Int(userInput), (userInputNumber == BankState.open.rawValue || userInputNumber == BankState.close.rawValue) else {
        print(MessageCollection.inputErrorText)
        return getInput()
    }
    return userInputNumber
}


