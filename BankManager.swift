//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bankState: Int = 0
    
    mutating func openBank() {
        repeat {
            print(MessageCollection.initializationText, terminator: "")
            
            guard let userInput: String = readLine(), let userInputNumber: Int = Int(userInput), (userInputNumber == 1 || userInputNumber == 2) else {
                print(MessageCollection.inputErrorText)
                return
            }
            self.bankState = userInputNumber
            let customers = Array(1...Int.random(in: 10...30))
            
            if self.bankState == 1 {
                let taskedTime = BankClerk().serveCustomers(customers: customers)
                MessageCollection.printCloseBankText(customers: customers.count, taskedTime: Double(taskedTime))
            }
        } while self.bankState == 1
    }
}


    
