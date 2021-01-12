//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by sole on 2021/01/08.
//

import Foundation

class BankClerk {
    var bankWindowNumber: Int
    var finishedCustomerNumber: Int = 0
    var totalTaskTime: Double = 0.0
    var working: Bool = false
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
    }
}

extension  BankClerk {
    
    func work() {
        startWork()
        finishWork()
    }
    
    func startWork() {
        guard let customer = bankManager.waitingList.first else {
            return
        }
        working = true
        let startMessage = String(format: ClerkWork.stratMessage.rawValue, bankWindowNumber, customer.index)
        print(startMessage)
    }
    
    func finishWork() {
        guard let customer = bankManager.waitingList.first else {
            return
        }
        finishedCustomerNumber += 1
        totalTaskTime += customer.taskTime
        let finishedMessage = String(format: ClerkWork.FinishedMessage.rawValue, bankWindowNumber, customer.index)
        print(finishedMessage)
        bankManager.waitingList.removeFirst()
        working = false
    }
}

