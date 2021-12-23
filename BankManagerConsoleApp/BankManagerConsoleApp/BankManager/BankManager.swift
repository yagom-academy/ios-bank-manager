//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    
    private let bank = Bank()
    private var randomClientNumber: Int {
        return Int.random(in: 10...30)
    }
    
    func openBank() {
        let clientCount = randomClientNumber
        for order in 1...clientCount {
            let client = Client(waitingNumber: order, task: .deposit)
            bank.lineUp(client)
        }
        bank.start()
    }
}
