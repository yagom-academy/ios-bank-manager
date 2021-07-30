//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    let bank = Bank()
    
    func createBankTellers() -> [BankTeller] {
        return [OrdinaryBankTeller()]
    }
    
    func generateRandomCustomerNumber() -> UInt {
        let minimumCustomerNumber: UInt = 10
        let maximumCustomerNumber: UInt = 30
        return UInt.random(in: minimumCustomerNumber...maximumCustomerNumber)
    }
}
