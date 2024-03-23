//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

struct Bank {
    var bankers: [Banker] = []
    var waitingCustomers: Queue<Customer> = Queue<Customer>()
    
    mutating func addBanker(_ banker: Banker) {
        bankers.append(banker)
    }
    
    mutating func addCustomer() {
        let totalCustomers = Int.random(in: 10...30)
        
        for number in 1...totalCustomers {
            let customer = Customer(number: number)
            waitingCustomers.enqueue(customer)
        }
    }
    
    mutating func preceedBankWork(_ banker: Banker) async throws -> Bool {
        if waitingCustomers.isEmpty {
            return false
        }
        
        guard let customer = waitingCustomers.dequeue() else {
            return false
        }
        
        try await banker.processCustomer(customer)
        
        return true
    }
}
