//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Bank {
    func message() {
        print("1 : 은행개점\n2 : 종료\n입력 : ", terminator: "")
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
            print("잘못입력하셨습니다. 다시 입력하세요")
            message()
        }
    }
}

var bank: Bank = Bank()
var bankManager: BankManager = BankManager(bankClerkCount: 1)
bank.message()
