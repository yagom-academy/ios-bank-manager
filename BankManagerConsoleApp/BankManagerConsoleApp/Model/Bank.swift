//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/23.
//

import Foundation

protocol BankDelegate: AnyObject {
    func printClosingMessage(customers: Int, processingTime: Double)
}

class Bank {
    private let customerQueue: Queue<Customer> = Queue<Customer>()
    private var bankClerk: BankClerk
    private weak var delegate: BankDelegate?
    
    init(bankClerk: BankClerk, delegatee: BankDelegate) {
        self.bankClerk = bankClerk
        self.delegate = delegatee
        setupCustomerQueue()
    }
    
    private func setupCustomerQueue() {
        let randomCustomerCount: Int = Int.random(in: 10...30)
        
        (1...randomCustomerCount).forEach { number in
            customerQueue.enqueue(value: Customer(turn: number))
        }
    }
    
    func open() {
        let semaphore = DispatchSemaphore(value: 2)
        let depositQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
        let loanQueue = DispatchQueue(label: "loan")
        let bankGroup = DispatchGroup()
        
        var processedCustomers = 0
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while let customer = customerQueue.dequeue() {
            switch customer.task {
            case .deposit:
                depositQueue.async(group: bankGroup) {
                    semaphore.wait()
                    self.bankClerk.work(with: customer)
                    semaphore.signal()
                }
            case .loan:
                loanQueue.async(group: bankGroup) {
                    self.bankClerk.work(with: customer)
                }
            }
            processedCustomers += 1
        }
        
        bankGroup.wait()
        
        let endTime = CFAbsoluteTimeGetCurrent()
        let totalProcessingTime = endTime - startTime
        close(totalCustomers: processedCustomers, totalProcessingTime: totalProcessingTime)
    }
    
    func close(totalCustomers: Int, totalProcessingTime: Double) {
        delegate?.printClosingMessage(customers: totalCustomers, processingTime: totalProcessingTime)
    }
}
