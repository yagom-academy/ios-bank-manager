//
//  Bank.swift
//  
//
//  Created by Hisop on 2023/11/17.
//

import Foundation

public final class Bank {
    private var name: String
    private var customerCount: Int = 0
    private var workTime: Double = 0
    
    private let customerQueue = CustomerQueue<Customer>()
    private let depositQueue = OperationQueue()
    private let loanQueue = OperationQueue()

    private let BankSemaphore = DispatchSemaphore(value: 1)
    
    init(name: String, chargeDepositCount: Int, chargeLoanCount: Int) {
        self.name = name
        depositQueue.maxConcurrentOperationCount = chargeDepositCount
        loanQueue.maxConcurrentOperationCount = chargeLoanCount
    }
    
    public func open() {
        addCustomer()
        addQueue()
        endWork()
    }
    
    private func addQueue() {
        while customerQueue.isEmpty() == false {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            let work = makeWork(customer: customer)
            switch customer.business {
            case .deposit:
                depositQueue.addOperation(work)
            case .loan:
                loanQueue.addOperation(work)
            }
        }
    }
    
    private func makeWork(customer: Customer) -> BlockOperation {
        let work = BlockOperation {
            WorkReport.startWork(customer: customer)
            Thread.sleep(forTimeInterval: customer.business.workTime)
        }
        work.completionBlock = { [self] in
            BankSemaphore.wait()
            workTime += customer.business.workTime
            customerCount += 1
            BankSemaphore.signal()
            
            WorkReport.endWork(customer: customer)
        }
        return work
    }
    
    private func endWork() {
        depositQueue.waitUntilAllOperationsAreFinished()
        loanQueue.waitUntilAllOperationsAreFinished()

        WorkReport.endWorkString(customerCount: customerCount, workTime: workTime)
        customerCount = 0
        workTime = 0
   }
    
    private func addCustomer() {
        let count = Int.random(in: 10...30)
        for number in 1...count {
            customerQueue.enqueue(value: Customer(number: number))
        }
    }
}
