//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by James on 2021/04/27.
//

import Foundation

final class Bank {
    var bankManager: BankManageable
    
    init(bankManager: BankManageable) {
        self.bankManager = bankManager
    }
}
