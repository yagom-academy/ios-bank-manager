//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct BankManager {
    
    private var numberOfBanker: Int
    private var waitingLine: OperationQueue
    private var customerMaker: CustomerMaker
    var numberOfCustomer: Int {
        return customerMaker.numberOfCustomer
    }
    
    init(numberOfBanker: Int) {
        self.numberOfBanker = numberOfBanker
        waitingLine = OperationQueue()
        customerMaker = CustomerMaker(numberOfCustomer: /*Int.random(in: 10...30)*/10)
        waitingLine.maxConcurrentOperationCount = self.numberOfBanker
    }
    
    func inputCustomersToWaitingLine() {
        var customers = customerMaker.makeCustomers()
        customers.sort{ $0.bankTask.queuePriority.rawValue > $1.bankTask.queuePriority.rawValue }
        customers.forEach {
            waitingLine.addOperation($0.bankTask)
        }
        waitingLine.waitUntilAllOperationsAreFinished()
    }
    
}

