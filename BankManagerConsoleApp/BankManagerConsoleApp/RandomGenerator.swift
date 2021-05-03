//
//  RandomGenerator.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

struct RandomGenerator {
    func generateRandomCustomer(bank: inout Bank) -> [Customer] {
        let totalCustomer = createRandomNumberInRange(10, to: 30)
        var customers = [Customer]()
        
        for _ in 1...totalCustomer {
            let ticketNumber = bank.getNewTicketNumber()
            let priority = Customer.Priority.random
            let task = Customer.Task.random
            let randomCustomer  = Customer(ticketNumber: ticketNumber, priority: priority, task: task)
            customers.append(randomCustomer)
        }
        
        return customers
    }
    
    private func createRandomNumberInRange(_ start: Int, to end: Int) -> Int {
        return Int.random(in: start...end)
    }
}
