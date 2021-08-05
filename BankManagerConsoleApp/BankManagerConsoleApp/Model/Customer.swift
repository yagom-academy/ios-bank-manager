//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

struct Customer {
    let desiredTask: BankingCategory
    let waitingNumber: UInt
    
    init(desiredTask: BankingCategory, waitingNumber: UInt) {
        self.desiredTask = desiredTask
        self.waitingNumber = waitingNumber
    }
}
