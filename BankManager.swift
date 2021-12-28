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
    func generateClients() -> [Client] {
        let clientNumber = Int.random(in: 10...30)
        var clients: [Client] = []
        
        (1...clientNumber).forEach { number in
            let orderTicket = Ticket(number: number)
            let client = Client(orderTicket: orderTicket)
            clients.append(client)
        }
        
        return clients
    }
    
    mutating func openBank() {
        let clients = generateClients()
        
        bank.receive(clients: clients)
        bank.executeBusiness()
    }
}
