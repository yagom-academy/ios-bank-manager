//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    enum OperationStatus: Int {
        case open = 1
        case close = 2
    }
    
    enum BusinessType {
        case loan
        
        var requiredTime: TimeInterval {
            switch self {
            case .loan:
                return 0.7
            }
        }
    }
    
    private var customerQueue = Queue<Customer>()
    
    func receiveCustomer(range: ClosedRange<Int>) {
        for order in range {
            customerQueue.enqueue(value: Customer(id: order, businessType: BusinessType.loan))
        }
    }
    
    func startBusiness() {
        let bankClerk = BankClerk(id: 1)
        var customer: Customer?
        while !customerQueue.isEmpty {
            customer = customerQueue.dequeue()
            bankClerk.doTask(about: customer)
        }
        endBusiness(after: customer)
    }
    
    private func endBusiness(after customer: Customer?) {
        guard let customer = customer else {
            return
        }
        let finishTime = Double(customer.id) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.id)명이며, 총 업무시간은 \(String(format: "%.2f", finishTime)) 입니다.")
    }
}
