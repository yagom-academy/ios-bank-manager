//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

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

class Customer {
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

class BankTask: Operation {
    private var taskTime: Double
    private var waitingNumber: Int
    
    init(taskTime: Double, _ waitingNumber: Int) {
        self.taskTime = taskTime
        self.waitingNumber = waitingNumber
    }
    
    override func main() {
        print(waitingNumber, "번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print(waitingNumber, "번 고객 업무 완료")
    }
}
