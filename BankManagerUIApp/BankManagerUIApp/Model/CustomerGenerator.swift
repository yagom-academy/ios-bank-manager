//
//  CustomerGenerator.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/15.
//

enum CustomerGenerator {
    static var totalCount: Int = 1
    
    static func make(numberOfCustomer: Int)  -> [Customer] {
        var customers: [Customer] = []
        for waitingNumber in totalCount...totalCount + 9 {
            guard let customer = Customer(waitingNumber: waitingNumber) else { return [] }
            
            Self.totalCount += 1
            customers.append(customer)
        }
        
        return customers
    }
}
