//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank
    private let clerkNumber: Int = 1
    private lazy var randomClientNumber = 0
    
    init() throws {
        self.bank = try Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        randomClientNumber = Int.random(in: 10...30)
        try bank.updateWaitingList(of: randomClientNumber)
        print("은행개점")
        bank.makeAllClerksWorkable()
    }
    
    func closeBank() {
        print(bank.endingMent)
    }
}

