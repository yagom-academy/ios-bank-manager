//
//  RandomGenerator.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

struct RandomGenerator {
    func generateRandomCustomer(ticketNumber: Int) -> Customer {
        return Customer(ticketNumber: ticketNumber)
    }
    
    func createRandomNumber() -> Int {
        return Int.random(in: 10...30)
    }
}
