//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/19.
//

struct CustomerQueue {
    private var customers: Queue<Customer>
    
    init() {
        self.customers = Queue<Customer>()
    }
    
    mutating func enqueue(customer: Customer) {
        customers.enqueue(customer)
    }
    
    mutating func dequeue() -> Customer? {
        return customers.dequeue()
    }
    
    var count: Int {
        return customers.count
    }
    
    var isEmpty: Bool {
        return customers.isEmpty
    }
}
