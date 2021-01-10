//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    private var bank: Bank
    private let clerkNumber: Int = 3
    private lazy var randomClientNumber = 0
    
    init() {
        self.bank = Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        randomClientNumber = Int.random(in: 10...30)
        try bank.updateWaitingList(of: randomClientNumber)
        print("은행개점")
        bank.startTimer()
        bank.makeAllClerksWork()
    }
    
    func closeBank() {
        bank.stopTimer()
        print(bank.endingMent)
    }
}

