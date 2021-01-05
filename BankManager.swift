//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    // MARK: - Types
    struct BankClerk {
        var bankWindowNumber: Int
        var isWorking: Bool
    }
    
    // MARK: - Properties
    private var bankClerks: [BankClerk] = [BankClerk]()
    private var watingClients: Queue<Int> = Queue<Int>()
    private var finishedClients: Queue<Int> = Queue<Int>()
    private var waitingTicketNumber: Int = 0
    
    // MARK: - Methods
    mutating func addBankClerk(of: Int) {
        guard of > 0 else {
            return
        }
        
        let lastCounterNumber = bankClerks.last?.bankWindowNumber ?? 0
        for i in 1...of {
            let banker = BankClerk(bankWindowNumber: i + lastCounterNumber, isWorking: false)
            bankClerks.append(banker)
        }
    }
    
    mutating func addClient(of: Int) {
        guard of > 0 else {
            return
        }
        
        for _ in 1...of {
            waitingTicketNumber += 1
            watingClients.enqueue(element: waitingTicketNumber)
        }
    }
    
    init(_ numberOfBankClerk: Int, _ numberOfClient: Int) {
        addBankClerk(of: numberOfBankClerk)
        addClient(of: numberOfClient)
    }
}
