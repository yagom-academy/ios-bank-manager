//
//  RandomGenerator.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

struct RandomGenerator {
    func generateRandomCustomer(ticketNumber: Int, task: Customer.Task) -> Customer {
        return Customer(ticketNumber: ticketNumber, task: task)
    }
    
    func createRandomNumber() -> Int {
        return Int.random(in: 10...30)
    }
}
