//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank
    private lazy var randomNumber: Int = 0
    
    init() {
        self.bank = Bank()
    }
    
    mutating func openBank() {
        print("은행개점")
        self.generateNumberOfClients()
    }
    
    func closeBank() {
        print("종료")
    }
    
    func showMenu() {
        print(" 1 : 은행개점 \n 2 : 종료\n 입력 :", terminator: " ")
    }
    
    private mutating func generateNumberOfClients() {
        let randomNumberOfClients = Int.random(in: 10...30)
        bank.initialNumberOfClients = randomNumberOfClients
    }
}

