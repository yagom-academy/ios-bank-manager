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

protocol BankTransactionable: AnyObject {
    func dequeue() -> Customer?
    func isCustomerQueueEmpty() -> Bool
    func open()
    func close(totalCustomers: Int, totalProcessingTime: Double)
}

class Bank: BankTransactionable {
    private let customerQueue: Queue<Customer> = Queue<Customer>()
    private var bankClerk: BankClerk
    private weak var delegate: BankDelegate?
    
    init(bankClerk: BankClerk, delegatee: BankDelegate) {
        self.bankClerk = bankClerk
        self.bankClerk.setBank(bank: self)
        self.delegate = delegatee
        setupCustomerQueue()
    }
    
    private func setupCustomerQueue() {
        let randomCustomerCount: Int = Int.random(in: 10...30)
        
        (1...randomCustomerCount).forEach { number in
            customerQueue.enqueue(value: Customer(turn: number))
        }
    }
    
    func dequeue() -> Customer? {
        return customerQueue.dequeue()
    }
    
    func isCustomerQueueEmpty() -> Bool {
        return customerQueue.isEmpty
    }
    
    func open() {
        bankClerk.work()
    }
    
    func close(totalCustomers: Int, totalProcessingTime: Double) {
        delegate?.printClosingMessage(customers: totalCustomers, processingTime: totalProcessingTime)
    }
}
