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
    static var headOfficeQueue: OperationQueue = OperationQueue()
    var numberOfCustomer: Int {
        return customerMaker.numberOfCustomer
    }
    
    init(numberOfBanker: Int) {
        self.numberOfBanker = numberOfBanker
        waitingLine = OperationQueue()
        customerMaker = CustomerMaker(numberOfCustomer: Int.random(in: 10...30))
        waitingLine.maxConcurrentOperationCount = self.numberOfBanker
    }
    
    func inputCustomersToWaitingLine() {
        let customers = customerMaker.makeCustomers()
        waitingLine.addOperations(customers.map({ $0.bankTask }), waitUntilFinished: true)
    }
    
}

