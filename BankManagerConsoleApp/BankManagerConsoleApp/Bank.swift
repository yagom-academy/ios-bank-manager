//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

class Bank {
    var waitingLine = Queue<Customer>()
    
    func open() {
        let randomNumber = Int.random(in: 10...30)
        
        for number in 1...randomNumber {
            let customer = Customer(waitingNumber: number)
            
            waitingLine.enqueue(customer)
        }
    }
}
