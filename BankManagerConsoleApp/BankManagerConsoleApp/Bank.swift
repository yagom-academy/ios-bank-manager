//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

struct Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var bankers: [Banker] = []
    
    mutating func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func addBanker(_ banker: Banker) {
        bankers.append(banker)
    }
}
