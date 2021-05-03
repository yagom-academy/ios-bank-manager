//
//  CustomerMaker.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.
//

import Foundation

struct CustomerMaker {
    
    private var _numberOfCustomer: Int
    var numberOfCustomer: Int {
        return _numberOfCustomer
    }
    
    init(numberOfCustomer: Int) {
        self._numberOfCustomer = numberOfCustomer
    }
    
    func makeCustomers() -> [Customer] {
        var customers: [Customer] = []
        for i in 1..._numberOfCustomer {
            customers.append(Customer(waitingNumber: i))
        }
        return customers
    }
    
}
