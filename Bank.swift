//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class Bank {
    private var clients: [Client] = []
    private var tellers: [Teller] = []
    private var finishedClientNumber = 0
    private var businessTime: TimeInterval?

    func operateBank(teller: Int, client: [Client]) {
        let openTime = Date()
        
        initTellers(teller)
        clients = client.sorted()
        assignBusinessToTeller()
        businessTime = Date().timeIntervalSince(openTime)
        Dashboard.printCloseMessage(finishedClientNumber, businessTime)
        closeBank()
    }
    
    private func initTellers(_ number: Int) {
        for windowNumber in 1...number {
            tellers.append(Teller(windowNumber: windowNumber))
        }
    }
    
    private func assignBusinessToTeller() {
        let dispatchGroup = DispatchGroup()
        var isContinue = true
        
        while isContinue {
            for teller in self.tellers {
                if self.clients.count == 0 {
                    isContinue = false
                    break
                }
                if teller.isNotWorking {
                    let client = clients.removeFirst()
                    teller.handleBusiness(for: client, withDispatchGroup: dispatchGroup)
                    self.finishedClientNumber += 1
                }
            }
        }
        dispatchGroup.wait()
    }
    
    private func closeBank() {
        tellers.removeAll()
        clients.removeAll()
        finishedClientNumber = 0
    }
}
