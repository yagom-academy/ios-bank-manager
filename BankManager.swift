//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    // MARK: - Types
    struct Banker {
        var counterNumber: Int
        var isWorking: Bool
    }
    
    // MARK: - Properties
    private var bankers: [Banker] = [Banker]()
    private var watingClients: Queue<Int> = Queue<Int>()
    private var finishedClients: Queue<Int> = Queue<Int>()
    private var waitingTicketNumber: Int = 0
    
    // MARK: - Methods
    mutating func addBanker(of: Int) {
        guard of > 0 else {
            return
        }
        
        let lastCounterNumber = bankers.last?.counterNumber ?? 0
        for i in 1...of {
            let banker = Banker(counterNumber: i + lastCounterNumber, isWorking: false)
            bankers.append(banker)
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
    
    init(_ numberOfBanker: Int, _ numberOfClient: Int) {
        addBanker(of: numberOfBanker)
        addClient(of: numberOfClient)
    }
}
