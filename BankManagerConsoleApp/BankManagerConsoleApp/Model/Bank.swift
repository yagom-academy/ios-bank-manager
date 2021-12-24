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
    var delegate: BankDelegate?
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        self.bankClerk.bank = self
    }
    
    func open() {
        bankClerk.work()
    }
    
    func close(totalCustomers: Int, totalProcessingTime: Double) {
        delegate?.printClosingMessage(customers: totalCustomers, processingTime: totalProcessingTime)
    }
}
