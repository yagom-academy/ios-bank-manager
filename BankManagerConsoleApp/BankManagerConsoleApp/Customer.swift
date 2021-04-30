//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct Customer {
    
    private var _bankTask: BankTask
    private var waitingNumber: Int
    var bankTask: BankTask {
        return _bankTask
    }

    init(waitingNumber: Int) {
        self._bankTask = BankTask(taskTime: 0.7, waitingNumber)
        self.waitingNumber = waitingNumber
    }
    
}
