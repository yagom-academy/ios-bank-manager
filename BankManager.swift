//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var bank = Bank()
    
    private func generateClients() -> [Client] {
        let clientNumber = Int.random(in: 10...30)
        var clients: [Client] = []
        
        (0..<clientCounts).forEach { _ in
            let client = Client()
            clients.append(client)
        }
        
        return clients
    }
}
