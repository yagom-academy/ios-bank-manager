//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    enum BankStatus: Int {
        case open = 1
        case close = 2
    }
    
    private var queue = Queue<Customer>()
    private var defaultFrom = 1
    private var defaultTo: Int {
        return Int.random(in: 10...30)
    }
    
    private func receiveCustomer(range: ClosedRange<Int>) {
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
            startTask(about: customer)
        }
        endTask(after: customer)
    }
    
    private func startTask(about customer: Customer?) {
        guard let customer = customer else {
            return
        }
        print("\(customer.id)번 고객 업무 시작")
        print("\(customer.id)번 고객 업무 종료")
    }
    
    private func endTask(after customer: Customer?) {
        guard let customer = customer else {
            return
        }
        let finishTime = Double(customer.id) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.id)명이며, 총 업무시간은 \(String(format: "%.2f", finishTime)) 입니다.")
    }
}
