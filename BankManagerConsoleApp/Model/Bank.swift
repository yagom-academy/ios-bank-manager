//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    enum Status: Int {
        case open = 1
        case close = 2
    }
    
    enum Job {
        case loan
        
        var time: UInt32 {
            switch self {
            case .loan:
                return 700000
            }
        }
    }
    
    private var queue = Queue<Customer>()
    
    func receiveCustomer(range: ClosedRange<Int>) {
        for order in range {
            queue.enqueue(value: Customer(id: order, requirement: Job.loan))
        }
    }
    
    func doTask() {
        let bankClerk = BankClerk(id: 1)
        var customer: Customer?
        while !queue.isEmpty {
            customer = queue.dequeue()
            bankClerk.startTask(about: customer)
        }
        endTask(after: customer)
    }
    
    private func endTask(after customer: Customer?) {
        guard let customer = customer else {
            return
        }
        let finishTime = Double(customer.id) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.id)명이며, 총 업무시간은 \(String(format: "%.2f", finishTime)) 입니다.")
    }
}
