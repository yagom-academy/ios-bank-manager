//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

import Foundation

struct Bank {
    let bankers: [Banker]
    var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    
    // 적절한 메서드명 고민해야함
    mutating func add(to customers: [Customer]) {
        customers.forEach { customerQueue.enqueue($0) }
    }
}
