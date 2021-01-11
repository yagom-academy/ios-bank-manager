//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by sole on 2021/01/08.
//

import Foundation

class BankClerk {
    let bankWindowNumber: Int
    var customers: [Custmer] = []
    var finishedCustomerNumber: Int = 0
    var totalTaskTime: Double = 0.0
    var working: WorkingStatus = .off {
        didSet {
            work()
        }
    }
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
    }
}

extension  BankClerk {
    
    func work() {
        if working == .enable {
            guard let custmer = bankManager.waitingList.first else {
                print(String(format: ClerkWork.ClosedMessage.rawValue, finishedCustomerNumber, totalTaskTime))
                bank.message()
                return
            }
            customers.append(custmer)
            startWork()
            finishWork()
        }
    }
    
    func startWork() {
        guard let customer = customers.first else {
            return
        }
        bankManager.waitingList.removeFirst()
        working = .disable
        print(String(format: ClerkWork.stratMessage.rawValue, bankWindowNumber, customer.index))
    }
    
    func finishWork() {
        guard let customer = customers.first else {
            return
        }
        finishedCustomerNumber += 1
        totalTaskTime += customer.taskTime
        customers.removeFirst()
        print(String(format: ClerkWork.FinishedMessage.rawValue, bankWindowNumber, customer.index))
        working = .enable
    }
}

