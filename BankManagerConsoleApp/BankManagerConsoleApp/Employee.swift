//
//  Employee.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

protocol Workable {
    var bank: WaitingLineManageable { get set }
}

struct Employee: Workable {
    var bank: WaitingLineManageable
    
    init(bank: WaitingLineManageable) {
        self.bank = bank
        
        self.bank.employee = self
    }
}
