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
    }
    
    func closeBank() {
        
    }
    
    mutating func visitClients(newClientsNumber: Int) {
        // 0이나 음수가 들어오면?
        for i in 1...newClientsNumber {
            let client = Client(waitingNumber: i, business: .basic)
            
            bank.waitingList.append(client)
            bank.totalVistedClientsNumber += newClientsNumber
        }
    }
    
    func assignCounter() {
        
    }

}

