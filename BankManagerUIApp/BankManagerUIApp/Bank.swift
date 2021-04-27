//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by 황인우 on 2021/04/27.
//

import Foundation

final class BankTeller: FrontServiceable {
    var windowsNumber: Int
    
    init(number: Int) {
        self.windowsNumber = number
    }
    
}

final class Bank {
    var bankTeller = BankTeller(number: 3)
    let bankManager = OperationQueue()
    var numbersOfBankTeller: Int = 0
    
    func serveClient() {
        bankManager.maxConcurrentOperationCount = bankTeller.windowsNumber
    }
}
