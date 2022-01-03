//
//  BankFactory.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/27.
//

import Foundation

struct BankFactory {
    static func createBank(with delegatee: BankClerkDelegate) -> Bank {
        let bankClerk = BankClerk(delegatee: delegatee)
        let bank = Bank(bankClerk: bankClerk)
        
        return bank
    }
}
