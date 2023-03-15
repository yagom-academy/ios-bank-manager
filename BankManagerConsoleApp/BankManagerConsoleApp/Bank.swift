//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/07.
//

import Foundation

struct Bank {
    private var customers: Queue<Customer> = Queue()
    private var numberOfCustomer = 0

    mutating func addCustomer() -> Customer? {
        guard let randomBanking = Banking.allCases.randomElement() else { return nil }
        
        numberOfCustomer += 1
        
        let customer = Customer(waitingNumber: numberOfCustomer, desiredBanking: randomBanking)
        
        customers.enqueue(customer)
        
        return customer
    }
    
    mutating func open() {
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else { break }
            
            BankManager.divideWork(accordingTo: customer)
        }
    }
}
