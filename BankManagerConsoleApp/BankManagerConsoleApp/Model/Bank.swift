//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김성준 on 2023/03/07.
//

import Foundation

struct Bank {
    var bankers: [Banker] = []
    var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    
    mutating func open() -> Int {
        setBankers()
        receiveCustomer()
        let totalCustomer = customerQueue.count
        
        orderWork()
        
        return totalCustomer
    }

    mutating func setBankers() {
        let yagom = Banker(name: "야곰")
        bankers.append(yagom)
    }
    
    mutating func receiveCustomer() {
        guard let totalCustomer = (10...30).randomElement() else { return }
        
        for number in 1...totalCustomer {
            let customer = Customer(numberTicket: number.description)
            customerQueue.enqueue(customer)
        }
    }
    
    mutating func orderWork() {
        let totalCustomer = customerQueue.count
        
        for _ in 1...totalCustomer {
            bankers.forEach { banker in
                let customer = customerQueue.dequeue()
                banker.doWork(for: customer)
            }
        }
    }
}
