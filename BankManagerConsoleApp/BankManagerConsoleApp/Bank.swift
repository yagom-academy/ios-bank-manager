//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/23.
//

import Foundation

struct Bank {
    
    let customerQueue: CustomerQueue<Customer>
    let numberOfCustomer: Int
    let taskTime: TimeInterval
    var numberOfCustomerRange: ClosedRange<Int> {
        return 1...numberOfCustomer
    }
    
    init(numberOfCustomerRange: ClosedRange<Int> = 10...30, taskTime: TimeInterval = 0.7) {
        self.customerQueue = CustomerQueue()
        self.numberOfCustomer = Int.random(in: numberOfCustomerRange)
        self.taskTime = taskTime
    }
    
    func enqueueCustomer() {
        for count in numberOfCustomerRange {
            let customer = Customer(turn: count)
            customerQueue.enqueue(data: customer)
        }
    }
    
    func task(of customer: Customer) {
        let turn = customer.turn
        print("\(turn)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(turn)번 고객 업무 완료")
    }
}
