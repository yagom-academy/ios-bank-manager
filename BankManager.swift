//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    private var clientQueue = [Client]()
    
    init() {
        let clerkNumber: Int = 3
        self.bank = Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        try generateRandomClients()
        print("은행개점")
        bank.startTimer()
        bank.makeAllClerksWork()
    }
    
    private mutating func generateRandomClients() throws {
        let randomClientNumber = Int.random(in: 10...30)
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

