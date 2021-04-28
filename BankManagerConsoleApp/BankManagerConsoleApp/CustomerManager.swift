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
        let randomCustomerNumber: Int = Int.random(in: 10...30)
        let customers = Array(1...randomCustomerNumber)
        
        print("(임시 콘솔 프린트) 오늘 방문할 고객은 총 \(randomCustomerNumber)명 입니다.")
        
        return customers
    }
    
    func matchBankerAndCustomer() -> Int {
        let customer = customers.removeFirst()
        
        return customer
    }
    
    func countCustomers() -> Int {
        return customers.count
    }
}
