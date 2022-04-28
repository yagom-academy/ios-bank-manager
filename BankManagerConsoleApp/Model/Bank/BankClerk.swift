//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct BankClerk {
    unowned private var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
    // 추후구현
    func work() {}
}
