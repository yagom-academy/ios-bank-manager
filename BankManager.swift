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
    private var clientQueue = [Client]()
    
    init() {
        self.bank = Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        try generateRandomClients()
        print("은행개점")
        bank.startTimer()
        bank.makeAllClerksWork()
    }
    
    private mutating func generateRandomClients() throws {
        randomClientNumber = Int.random(in: 10...30)
        for i in 1...randomClientNumber {
            guard let randomBusinessType = BusinessType.allCases.randomElement(),
                  let randomClientGrade = ClientGrade.allCases.randomElement() else {
                return
            }
            
            let newClient = Client(waitingNumber: i, business: randomBusinessType, grade: randomClientGrade)
            clientQueue.append(newClient)
        }

        try bank.updateWaitingList(from: clientQueue)
    }
    
    func closeBank() {
        bank.stopTimer()
        bank.printEndingMent()
    }
}

