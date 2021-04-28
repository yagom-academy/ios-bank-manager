//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class CustomerMaker {
    private var numberOfCustomer: Int
    
    init() {
        self.numberOfCustomer = Int.random(in: 10...30)
    }
    
    func makeCustomers() -> [Customer] {
        var customers: [Customer] = []
        for i in 1...numberOfCustomer {
            customers.append(Customer(waitingNumber: i))
        }
        return customers
    }
}

class BankManager {
    private var numberOfBanker: Int
    private var waitingLine: OperationQueue
    private var customerMaker: CustomerMaker
    
    init(numberOfBanker: Int) {
        self.numberOfBanker = numberOfBanker
        waitingLine = OperationQueue()
        customerMaker = CustomerMaker()
        waitingLine.maxConcurrentOperationCount = self.numberOfBanker
    }
    
    func inputCustomersToWaitingLine() {
        customerMaker.makeCustomers().forEach{ waitingLine.addOperation($0.bankTask) }
        waitingLine.waitUntilAllOperationsAreFinished()
    }
}
