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

var todayCustomerNumber = generateRandomNumberOfCustomer()
let bankManagerNumber = 1
var bank = Bank(customerNumber: todayCustomerNumber, bankManagerNumber: bankManagerNumber)
