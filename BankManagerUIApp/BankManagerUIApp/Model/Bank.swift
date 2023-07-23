//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

import Foundation

final class Bank {
    private var depositBankerQueue = OperationQueue()
    private var loanBankerQueue = OperationQueue()
    private var waitingQueue = CustomerQueue<Customer>()
    private var dailyTotalCustomer: Int = .zero
    weak var delegate: BankViewControllerDelegate?
    
    init() {
        depositBankerQueue.maxConcurrentOperationCount = Configuration.numberOfDepositBanker
        loanBankerQueue.maxConcurrentOperationCount = Configuration.numberOfLoanBanker
    }
    
    
    func work() {
        let totalCustomer = setRandomNumberOfCustomer()
        addCustomerIntoWaitingQueue(totalCustomer)
        moveWaitingCustomerToBankerQueue()
    }
    
    func work(totalCustomer: Int) {
        addCustomerIntoWaitingQueue(totalCustomer)
        moveWaitingCustomerToBankerQueue()
    }
    
    private func moveWaitingCustomerToBankerQueue() {
        while let customer = waitingQueue.dequeue() {
            addTask(customer)
            delegate?.addWaitingQueue(customer)
        }
    }
    
    private func addCustomerIntoWaitingQueue(_ totalCustomer: Int) {
        for _ in 1...totalCustomer {
            dailyTotalCustomer += 1
            
            guard let customer = Customer(waitingNumber: dailyTotalCustomer) else {
                continue
            }
        
            waitingQueue.enqueue(customer)
        }
    }
    
    private func setRandomNumberOfCustomer() -> Int {
        let totalCustomer = Int.random(
            in: Configuration.minimumCustomer...Configuration.maximumCustomer
        )
        
        return totalCustomer
    }

    private func addTask(_ customer: Customer) {
        let task = BlockOperation {
            self.delegate?.moveCustomerToProcessQueue(customer)
            Thread.sleep(forTimeInterval: customer.purpose.duration)
            self.delegate?.popProcessingQueue(customer)
        }
        
        if customer.purpose == Customer.Purpose.deposit {
            depositBankerQueue.addOperation(task)
        } else {
            loanBankerQueue.addOperation(task)
        }
    }
    
    func reset() {
        depositBankerQueue.cancelAllOperations()
        loanBankerQueue.cancelAllOperations()
        waitingQueue.clear()
        dailyTotalCustomer = .zero
        
        self.delegate?.resetUI()
        work()
    }
}

extension Bank {
    enum Configuration {
        static let numberOfDepositBanker = 2
        static let numberOfLoanBanker = 1
        static let minimumCustomer = 10
        static let maximumCustomer = 30
    }
}
