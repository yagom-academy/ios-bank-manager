//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by sole on 2021/01/08.
//

import Foundation

class BankClerk {
    var bankWindowNumber: Int
    var customers: [Custmer] = []
    var finishedCustomerNumber: Int = 0
    var totalTaskTime: Double = 0.0
    var working: Bool = false
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
    }
}

extension  BankClerk {
    
    func work() {
        guard let custmer = bankManager.waitingList.first else {
            return
        }
        customers.append(custmer)
        startWork()
        finishWork()
    }
    
    func startWork() {
        guard let customer = customers.first else {
            return
        }
        bankManager.waitingList.removeFirst()
        working = true
        let startMessage = String(format: ClerkWork.stratMessage.rawValue, bankWindowNumber, customer.index)
        print(startMessage)
    }
    
    func finishWork() {
        guard let customer = customers.first else {
            return
        }
        finishedCustomerNumber += 1
        totalTaskTime += customer.taskTime
        customers.removeFirst()
        let finishedMessage = String(format: ClerkWork.FinishedMessage.rawValue, bankWindowNumber, customer.index)
        print(finishedMessage)
        working = false
    }
}

