//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

import Foundation

final class Bank {
    private var loanSection: BusinessSection
    private var depositSection: BusinessSection
    private let customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
    private let dispatchGroup = DispatchGroup()
    private(set) var timer = BusinessTimer()
    
    init() {
        loanSection = BusinessSection(
            queueName: "대출창구",
            businessType: .loan,
            numberOfBankers: 1
        )
        depositSection = BusinessSection(
            queueName: "예금창구",
            businessType: .deposit,
            numberOfBankers: 2
        )
    }
    
    func setUpCustomerQueue(customers: [Customer]) {
        customers.forEach {
            customerQueue.enqueue($0)
        }
    }
    
    func startBankService() {
        loanSection.isWorking = true
        depositSection.isWorking = true
        work()
        
        dispatchGroup.notify(queue: .global()) {
            self.timer.cancel()
        }
    }

    func reset() {
        customerQueue.clear()
        loanSection.isWorking = false
        depositSection.isWorking = false
    }
    
    private func work() {
        while !customerQueue.isEmpty {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            
            switch currentCustomer.businessType {
            case .loan:
                loanSection.processJob(for: currentCustomer, group: dispatchGroup)
            case .deposit:
                depositSection.processJob(for: currentCustomer, group: dispatchGroup)
            }
        }
    }
}
