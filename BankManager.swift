//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var bank = Bank(numberOfClerks: 1)
    
    private func generateClients() -> [Client] {
        let clientNumber = Int.random(in: 10...30)
        var clients: [Client] = []
        
        (1...clientNumber).forEach { number in
            let orderTicket = Ticket(number: number)
            let client = Client(orderTicket: orderTicket)
            clients.append(client)
        }
        
        return clients
    }
}
