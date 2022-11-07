//  BankManagerConsoleApp - Bank.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class Bank {
    private let banker: Banker = Banker()
    private var loanCustomerQueue: CustomerQueue = CustomerQueue()
    private var depositCustomerQueue: CustomerQueue = CustomerQueue()
    private let depositSemaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    private let loanSemaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    private let depositBankerCount: Int
    private let loanBankerCount: Int
    private let customerCount: Int
    
    init() {
        customerCount = Int.random(in: 10...30)
        depositBankerCount = 2
        loanBankerCount = 1
        setCustomerQueue()
    }
    
    private func setCustomerQueue() {
        for count in 1...customerCount {
            guard let randomBankingService: BankingService = BankingService.random() else {
                return
            }
            
            let customer: Customer = Customer(waitingNumber: count,
                                              bankingService: randomBankingService)
            
            switch customer.bankingService {
            case .loan:
                loanCustomerQueue.enqueue(customer)
            case .deposit:
                depositCustomerQueue.enqueue(customer)
            }
        }
    }
    
    func startBankingService(completion: @escaping (Int, Double) -> Void) {
        let group: DispatchGroup = DispatchGroup()
        let startingTime: Date = Date()
        
        for _ in 1...depositBankerCount {
            DispatchQueue.global().async(group: group) {
                self.entrustBankerService(of: .deposit)
            }
        }
        
        for _ in 1...loanBankerCount {
            DispatchQueue.global().async(group: group) {
                self.entrustBankerService(of: .loan)
            }
        }
        
        group.wait()
        
        let totalServiceTime: Double = Date().timeIntervalSince(startingTime)
        
        completion(customerCount, totalServiceTime)
    }
    
    private func entrustBankerService(of bankingService: BankingService) {
        guard let currentCustomer: Customer = requestCustomer(of: bankingService) else {
            return
        }
        
        banker.work(currentCustomer) {
            self.entrustBankerService(of: bankingService)
        }
    }
    
    private func requestCustomer(of bankingService: BankingService) -> Customer? {
        let currentCustomer: Customer?
        
        switch bankingService {
        case .loan:
            loanSemaphore.wait()
            currentCustomer = loanCustomerQueue.dequeue()
            loanSemaphore.signal()
        case.deposit:
            depositSemaphore.wait()
            currentCustomer = depositCustomerQueue.dequeue()
            depositSemaphore.signal()
        }
        
        return currentCustomer
    }
}
