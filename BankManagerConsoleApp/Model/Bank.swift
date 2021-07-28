//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    var queue = Queue<Customer>()
    var defaultFrom = 1
    var defaultTo: Int {
        return Int.random(in: 10...30)
    }
    
    func receiveCustomer(range: ClosedRange<Int>) {
        for order in range {
            queue.enqueue(value: Customer(id: order))
        }
    }
    
    func receiveCustomer() {
        receiveCustomer(range: defaultFrom...defaultTo)
    }
    
    func doTask() {
        var customer: Customer?
        while !queue.isEmpty {
            customer = queue.dequeue()
            task(about: customer)
        }
        end(lastCustomer: customer)
    }
    
    private func task(about customer: Customer?) {
        guard let customer = customer else {
            return
        }
        let startTime = Double(customer.id - 1) * 0.7
        let finishTime = Double(customer.id) * 0.7
        print("\(customer.id)번 고객 업무 시작")
        print("\(customer.id)번 고객 업무 종료")
    }
    
    private func end(lastCustomer: Customer?) {
        guard let customer = lastCustomer else {
            return
        }
        let finishTime = Double(customer.id) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.id)명이며, 총 업무시간은 \(finishTime) 입니다.")
    }
}
