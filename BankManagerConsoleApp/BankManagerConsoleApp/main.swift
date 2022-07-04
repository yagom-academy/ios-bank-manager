//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func userInput() -> String {
    return readLine()?.trimmingCharacters(in: .whitespaces) ?? BankComment.emptyValue.rawValue
}

func setCustomerCount() -> Int {
    return Int.random(in: SetNumber.minCustomer.rawValue...SetNumber.maxCustomer.rawValue)
}

func initiateBankBusiness() {
    var bank = Bank()
    
    bank.bankBusinessStart()
}

initiateBankBusiness()
