//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

class Customer {
    let desiredTask: BankingTask
    let waitingNumber: UInt
    
    init(desiredTask: BankingTask, waitingNumber: UInt) {
        self.desiredTask = desiredTask
        self.waitingNumber = waitingNumber
    }
}
