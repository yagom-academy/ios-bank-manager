//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

struct Customer {
    private let _desiredTask: BankingTask
    private let _waitingNumber: UInt
    
    var desiredTask: BankingTask {
        get {
            return self._desiredTask
        }
    }
    
    var waitingNumber: UInt {
        get {
            return self._waitingNumber
        }
    }
    
    init(desiredTask: BankingTask, waitingNumber: UInt) {
        self._desiredTask = desiredTask
        self._waitingNumber = waitingNumber
    }
}
