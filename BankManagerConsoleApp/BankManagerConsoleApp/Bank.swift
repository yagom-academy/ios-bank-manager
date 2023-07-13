//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

struct Bank {
    var tellers: [Teller]
    let customerNumber: Int = Int.random(in: 10...30)
    let waiting = LinkedList<Customer>()
    var totalTime: Double
    
    mutating func giveTicketNumber(numbers: Int) {
        for number in 1...numbers {
            let customer = Customer(numberTicket: number)
            
            waiting.append(value: customer)
        }
    }
}
