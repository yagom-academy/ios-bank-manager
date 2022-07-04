//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func userInput() -> String {
    return readLine()?.trimmingCharacters(in: .whitespaces) ?? BankComent.emptyValue.rawValue
}

func initiateBankBusiness() {
    var bank = Bank()
    
    bank.bankBusinessStart()
}

initiateBankBusiness()
