//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/23.
//

import Foundation

class Bank {
    var customerQueue: Queue<Customer> = Queue<Customer>()
    var bankClerk: BankClerk
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        self.bankClerk.bank = self
    }
    
    func open() {
        bankClerk.startWork()
    }
}
