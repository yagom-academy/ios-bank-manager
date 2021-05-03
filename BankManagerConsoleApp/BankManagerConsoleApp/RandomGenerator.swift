//
//  RandomGenerator.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

protocol RandomGeneratable {
    var totalCustomer: Int { get }
    mutating func generateRandomCustomer() -> [Customer]
}

struct RandomGenerator: RandomGeneratable {
    private(set) var totalCustomer: Int = 0
    
    mutating func generateRandomCustomer() -> [Customer] {
        totalCustomer = createRandomNumberInRange(10, to: 30)
        var customers = [Customer]()
        
        for customerNumber in 1...totalCustomer {
            let ticketNumber = customerNumber
            let priority = Customer.Priority.random
            let task = Customer.Task.random
            let randomCustomer  = Customer(ticketNumber: ticketNumber, priority: priority, task: task)
            customers.append(randomCustomer)
        }
        
        return customers
    }
    
    private func createRandomNumberInRange(_ start: Int, to end: Int) -> Int {
        guard start < end else {
            return Int.random(in: end...start)
        }
        return Int.random(in: start...end)
    }
}
