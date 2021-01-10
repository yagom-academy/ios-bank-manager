//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank
    private let clerkNumber: Int = 3
    private lazy var randomClientNumber = 0
    private var queue = [Client]()
    
    init() {
        self.bank = Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        try generateRandomClients()
        print("은행개점")
        bank.makeAllClerksWork()
    }
    
    private mutating func generateRandomClients() throws {
        randomClientNumber = Int.random(in: 10...30)
        for i in 1...randomClientNumber {
            guard let businessType = BusinessType.allCases.randomElement(),
                  let clientGrade = ClientGrade.allCases.randomElement() else {
                return
            }
            
            let newClient = Client(waitingNumber: i, business: businessType, grade: clientGrade)
            queue.append(newClient)
        }
        
        queue.sort { (client1, client2) -> Bool in
            client1.grade.rawValue < client2.grade.rawValue
        }

        try bank.updateWaitingList(to: queue)
    }
    
    func closeBank() {
        print(bank.endingMent)
    }
}

