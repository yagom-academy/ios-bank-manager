//
//  CustomerManager.swift
//  BankManagerConsoleApp
//
//  Created by 기원우 on 2021/04/27.
//

import Foundation

class CustomerManager {
    private lazy var customers: [Int] = visitCustomers()
    
    private func visitCustomers() -> [Int] {
        return Array(1...Int.random(in: 10...30))
    }
    
    func matchBankerAndCustomer() -> Int {
        let customer = customers.removeFirst()
        
        return customer
    }
    
    func countCustomers() -> Int {
        return customers.count
    }
    
}
