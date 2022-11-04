//  BankManagerConsoleApp - Bank.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class Bank {
    private let banker: Banker = Banker()
    private var customerQueue: CustomerQueue = CustomerQueue()
    private let customerCount: Int
    private let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    var workResult: (customerCount: Int, time: Double) {
        return (customerCount, Double(customerCount) * 0.7)
    }
    
    init() {
        customerCount = Int.random(in: 10...30)
        setCustomerQueue()
    }
    
    private func setCustomerQueue() {
        for count in 1...customerCount {
            guard let randomBankingService: BankingService = BankingService.random() else {
                return
            }
            
            let customer: Customer = Customer(waitingNumber: count,
                                              bankingService: randomBankingService)
            
            customerQueue.enqueue(customer)
        }
    }
    
    func entrustBankerService() {
        guard let currentCustomer: Customer = requestCustomer() else {
            return
        }

        banker.work(currentCustomer) {
            self.entrustBankerService()
        }
    }
    
    func startBankingService() {
        let group: DispatchGroup = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            self.entrustBankerService()
        }
        
        group.wait()
    }
    
    func requestCustomer() -> Customer? {
        semaphore.wait()
        
        defer {
            semaphore.signal()
        }
        
        return customerQueue.dequeue()
    }
}
