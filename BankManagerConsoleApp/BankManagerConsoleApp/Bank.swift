//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

struct Bank: Manageable {
    var name: String
    var tellers: [Teller]
    let customerNumber: Int = Int.random(in: 10...30)
    var waiting = Queue<Customer>()
    var totalTime: Double
    
    mutating func start() {
        giveTicketNumber(numbers: customerNumber)
        assignCustomer()
    }
    
    mutating func giveTicketNumber(numbers: Int) {
        for number in 1...numbers {
            let customer = Customer(numberTicket: number)
            
            waiting.enqueue(customer)
        }
    }
    
    mutating func assignCustomer() {
        while !waiting.isEmpty {
            for teller in tellers {
                guard let customer = waiting.dequeue() else {
                    return
                }
                
                teller.processCustomer(customer)
            }
        }
    }
}
