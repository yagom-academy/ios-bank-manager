//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    let mainQueue = OperationQueue()
    var customer: Int = 0
    var banker: Int
    
    init(banker: Int) {
        self.banker = banker
    }
}
