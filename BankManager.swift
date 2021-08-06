//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let clerk = Clerk(deposit: 2, loan: 1)
    private let customerQueue = Queue<Customer>()
    let numberOfCustomer: Int

    func processTask() {
        customers(customer: customerQueue)
        var totalCustomer = 0
        let increaseOne = 1
        var totalTaskTime: Double = 0

        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }

            clerk.doTask(customer: Customer(waitingNumber: customer.waitingNumber, businessType: customer.businessType))
            totalCustomer += increaseOne
            totalTaskTime += customer.businessType.processingTime
        }

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(String(format: "%.2f",totalTaskTime))초입니다.")
    }
}

extension BankManager: Receivable {
    func customers(customer: Queue<Customer>) {
        let firstNumber = 1
        for number in firstNumber...numberOfCustomer {
            guard let customerType = BusinessType.allCases.randomElement() else { return }
            let customer = Customer(waitingNumber: number, businessType: customerType)
            customerQueue.enqueue(data: customer)
        }
    }
}
