//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    let counter = OperationQueue()
    var numberOfClient: Int = 0
    var numberOfTeller: Int
    
    init(numberOfTeller: Int) {
        self.numberOfTeller = numberOfTeller
    }

    func generateNumberOfClient() {
        numberOfClient = Int.random(in: 10...30)
    }
}
