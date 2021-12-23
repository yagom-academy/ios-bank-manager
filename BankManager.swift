//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
        setupCustomerQueue()
    }
    
    private func setupCustomerQueue() {
        let randomCustomerCount: Int = Int.random(in: 10...30)
        
        for number in 1...randomCustomerCount {
            bank.customerQueue.enqueue(value: Customer(turn: number))
        }
    }
}
