//
//  BankFactory.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/27.
//

import Foundation

struct BankFactory {
    static func createBank(with delegatee: BankPrinter) -> Bank {
        let bankClerk = BankClerk()
        let bank = Bank(bankClerk: bankClerk)
        
        bank.delegate = delegatee
        bankClerk.delegate = delegatee
        return bank
    }
}
