//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김성준 on 2023/03/07.
//

import Foundation

struct Bank {
    var bankers: [Banker]
    var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    
    func open() {
        
    }
    ///Todo
    ///1. 뱅커한테 일시키기
    ///2. 고객 받기
    
    mutating func setBankers() {
        let yagom = Banker(name: "야곰")
        bankers.append(yagom)
    }
    
    mutating func receiveCustomer() {
        guard let numberOfCustomer = (10...30).randomElement() else { return }
        
        for number in 0...numberOfCustomer {
            let customer = Customer(numberTicket: number.description)
            customerQueue.enqueue(customer)
        }
    }
}
