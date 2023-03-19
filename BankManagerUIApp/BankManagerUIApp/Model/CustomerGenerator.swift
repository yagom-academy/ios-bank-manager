//
//  CustomerGenerator.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/15.
//

struct CustomerGenerator {
    private var totalCount: Int = 1
    
    mutating func make(numberOfCustomer: Int)  -> [Customer] {
        var customers: [Customer] = []
        for waitingNumber in totalCount...totalCount + 9 {
            guard let customer = Customer(waitingNumber: waitingNumber) else { return [] }
            
            self.totalCount += 1
            customers.append(customer)
        }
        
        return customers
    }
    
    mutating func reset() {
        self.totalCount = 1
    }
}
