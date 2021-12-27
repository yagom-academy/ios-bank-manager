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

protocol Transactionable: AnyObject {
    var customerQueue: Queue<Customer> { get }
    func open()
    func close(totalCustomers: Int, totalProcessingTime: Double)
}

class Bank: Transactionable {
    let customerQueue: Queue<Customer> = Queue<Customer>()
    var bankClerk: BankClerk
    weak var delegate: BankDelegate?
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        self.bankClerk.bank = self
        setupCustomerQueue()
    }
    
    private func setupCustomerQueue() {
        let randomCustomerCount: Int = Int.random(in: 10...30)
        
        (1...randomCustomerCount).forEach { number in
            customerQueue.enqueue(value: Customer(turn: number))
        }
    }
    
    func open() {
        bankClerk.work()
    }
    
    func close(totalCustomers: Int, totalProcessingTime: Double) {
        delegate?.printClosingMessage(customers: totalCustomers, processingTime: totalProcessingTime)
    }
}
