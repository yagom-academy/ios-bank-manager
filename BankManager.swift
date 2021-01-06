//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank
    
    init() {
        self.bank = Bank(employeeNumber: 1)
    }
    
    mutating func openBank() {
        bank.updateWaitingList(of: Int.random(in: 10...30))
        print("은행개점")
        bank.makeAllClerksWorkable()
        print(bank.endingMent)
    }
    
    func closeBank() {
        print("종료")
    }
}

