//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    static let shared = BankManager()
    private init() {}
    private var bank: Bank?
    
    func initBank(windowNumber: Int, bankersNumber: Int, bankersProcessingTime: Double) {
        bank = Bank(windowNumber: windowNumber, bankersNumber: bankersNumber, bankersProcessingTime: bankersProcessingTime)
    }
}
