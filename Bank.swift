//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class Bank {
    private var clients: [Client] = []
    private var tellers: [Teller] = []
    private var finishedClientCount = 0
    private var businessTime: TimeInterval?

    func open(teller: [Teller], client: [Client]) {
        let openTime = Date()
        
        tellers = teller
        clients = client.sorted()
        assignBusinessToTeller()
        businessTime = Date().timeIntervalSince(openTime)
        Dashboard.printCloseMessage(finishedClientCount, businessTime)
        resetFinishedClientCount()
    }
    
    private func assignBusinessToTeller() {
        let dispatchGroup = DispatchGroup()
        var isContinue = true
        
        while isContinue {
            for teller in tellers {
                if clients.count == 0 {
                    isContinue = false
                    break
                }
                if teller.isNotWorking {
                    let client = clients.removeFirst()
                    teller.handleBusiness(for: client, withDispatchGroup: dispatchGroup)
                    finishedClientCount += 1
                }
            }
        }
        dispatchGroup.wait()
    }
    
    private func resetFinishedClientCount() {
        finishedClientCount = 0
    }
}
