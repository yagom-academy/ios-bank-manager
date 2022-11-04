//  BankManagerConsoleApp - Bank.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class Bank {
    private let banker: Banker = Banker()
    private var customerQueue: CustomerQueue = CustomerQueue()
    private let customerCount: Int
    private let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
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
    
    func startBankingService(completion: @escaping (Int, Double) -> Void) {
        let group: DispatchGroup = DispatchGroup()
        let startingTime: Date = Date()
        
        DispatchQueue.global().async(group: group) {
            self.entrustBankerService()
        }
        
        DispatchQueue.global().async(group: group) {
            self.entrustBankerService()
        }
        
        DispatchQueue.global().async(group: group) {
            self.entrustBankerService()
        }
        
        group.wait()
        
        let totalServiceTime: Double = Date().timeIntervalSince(startingTime)
        completion(customerCount, totalServiceTime)
    }
    
    private func entrustBankerService() {
        guard let currentCustomer: Customer = requestCustomer() else {
            return
        }

        banker.work(currentCustomer) {
            self.entrustBankerService()
        }
    }
    
    private func requestCustomer() -> Customer? {
        semaphore.wait()
        
        defer {
            semaphore.signal()
        }
        
        return customerQueue.dequeue()
    }
}
