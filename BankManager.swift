//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var bank = Bank()
    
    mutating func openBank(bankClerkNumber: Int) {
        // 0이나 음수가 들어오면?
        for i in 1...bankClerkNumber {
            bank.serviceCounter[i] = BankClerk()
        }
        
        visitClients(newClientsNumber: Int.random(in: 10...30))
    }
    
    func closeBank() {
        
    }
    
    mutating func visitClients(newClientsNumber: Int) {
        // 0이나 음수가 들어오면?
        bank.totalVistedClientsNumber += newClientsNumber
        
        for _ in 1...newClientsNumber {
            bank.totalVistedClientsNumber += 1
            
            let client = Client(waitingNumber: bank.totalVistedClientsNumber, business: .basic)
            
            bank.waitingList.append(client)
        }
    }
    
    func assignCounter() {
        
    }

}

