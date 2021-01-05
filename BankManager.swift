//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    
    struct Banker {
        var counterNumber: Int
        var isWorking: Bool
    }
    
    private var bankers = [Banker]()
        
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
        
    init(numberOfBanker: Int) {
        addBanker(of: numberOfBanker)
    }
}
