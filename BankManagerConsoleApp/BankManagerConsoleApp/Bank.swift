//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    let banker: Int?
    let customer: Customer
    let customerQueue = BankManagerQueue<Int>()
    
    func initCustomerQueue() {
        for customer in 1...customer.numbers {
            customerQueue.enqueue(data: customer)
        }
    }
    
    func begenToWork() {
        if let startCurrentCustomer = customerQueue.peek(),
           let finishCurrentCustomer = customerQueue.dequeue() {
            print("\(startCurrentCustomer) 번 고객업무 시작")
            print("\(finishCurrentCustomer) 번 고객업무 완료")
        }
    }
}
