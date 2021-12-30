//
//  BankFactory.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/27.
//

import Foundation

struct BankFactory {
    static func createBank(with delegatee: BankPrinter) -> Bank {
        let bankClerk = BankClerk(delegatee: delegatee)
        let bank = Bank(bankClerk: bankClerk, delegatee: delegatee)
        
        return bank
    }
}
