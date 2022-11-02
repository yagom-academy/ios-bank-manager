//  BankManagerConsoleApp - Bank.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Bank {
    private let banker: Banker = Banker()
    private var customerQueue: Queue<Customer> = Queue<Customer>()
    
    mutating func setCustomerQueue() {
        let customerCount: Int = Int.random(in: 10...30)
        for count in 1...customerCount {
            let customer: Customer = Customer(waitingNumber: count, bankingService: Loan())
            customerQueue.enqueue(customer)
        }
    }
    
    mutating func startBankingService() {
        while let currentCustomer: Customer = customerQueue.dequeue() {
            banker.work(currentCustomer)
        }
    }
}
