//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func openBank() {
        bank.openedBank()
        
        let customerCount: Int = Int.random(in: 10...30)
        
        for turn in 1...customerCount {
            let newCustomer: Customer = Customer(ticketNumber: turn)
            self.bank.addCustomer(customer: newCustomer)
        }
    }
    
    mutating func startBankWork() {
        bank.startWork()
    }
}
