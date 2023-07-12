//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let bank = Bank(bankClerk: BankClerk(), customerCount: Int.random(in: 10...30))
    
    func startBank() {
        bank.start()
    }
}
