//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    //MARK: - 저장 속성
    private var bank: Bank
    
    //MARK: - 생성자
    init(bank: Bank) {
        self.bank = bank
    }
    
    //MARK: - 메서드
    mutating func openBank(for clients: [Client]) {
        bank.receive(clients: clients)
        bank.executeBusiness()
    }
}
