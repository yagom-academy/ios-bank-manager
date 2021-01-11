//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Bank {
    func message() {
        print(BankMessage.open.rawValue, terminator: "")
        guard let input = readLine() else {
            return
        }
        switch input {
        case "1":
            bankManager.holdCustomers()
            bankManager.makeBankClerk()
            bankManager.arrangeCustomerFirstTime()
        case "2":
            return
        default:
            print(BankMessage.error.rawValue)
            message()
        }
    }
}

var bank: Bank = Bank()
var bankManager: BankManager = BankManager(bankClerkCount: 1)
bank.message()
