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
    private var depositWorkItem: DispatchWorkItem?
    private var loanWorkItem: DispatchWorkItem?
    
    init(depositBankerCount: Int, loanBankerCount: Int) {
        self.depositBankerCount = depositBankerCount
        self.loanBankerCount = loanBankerCount
        setWorkItem()
    }
    
    func setCustomerQueue(from customers: [Customer]) {
        customers.forEach {
            switch $0.bankingService {
            case .loan:
                loanCustomerQueue.enqueue($0)
            case .deposit:
                depositCustomerQueue.enqueue($0)
            }
        }
    }
    
    private func setWorkItem() {
        depositWorkItem = DispatchWorkItem {
            self.entrustBankerService(of: .deposit)
        }
        loanWorkItem = DispatchWorkItem {
            self.entrustBankerService(of: .loan)
        }
    }
    
    func startBankingService() {
        guard let depositWorkItem = depositWorkItem,
              let loanWorkItem = loanWorkItem else {
            return
        }
        
        let group: DispatchGroup = DispatchGroup()
        
        for _ in 1...depositBankerCount {
            DispatchQueue.global().async(group: group, execute: depositWorkItem)
        }
        
        for _ in 1...loanBankerCount {
            DispatchQueue.global().async(group: group, execute: loanWorkItem)
        }
        
        group.wait()
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
    
    func removeAllCustomers() {
        depositCustomerQueue.clear()
        loanCustomerQueue.clear()
    }
}
