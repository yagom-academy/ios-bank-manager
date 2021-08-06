//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let customerQueue = Queue<Customer>()
    let window: Clerk
    let numberOfCustomer: Int

    func processTask() {
        receiveCustomers(customer: customerQueue)
        var totalCustomer = 0
        let increaseOne = 1
        let startTime = CFAbsoluteTimeGetCurrent()
        let group = DispatchGroup()
        let loanSemaphore = DispatchSemaphore(value: window.loan)
        let depositSemaphore = DispatchSemaphore(value: window.deposit)

        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            if customer.businessType == .loan {
                handleLoan(for: customer, group: group, semaphore: loanSemaphore)
            } else {
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    window.doTask(customer: Customer(waitingNumber: customer.waitingNumber,
                                                     businessType: customer.businessType))
                    depositSemaphore.signal()
                }
            }
            totalCustomer += increaseOne
        }

        group.wait()
        close(customerCount: totalCustomer, taskTime: CFAbsoluteTimeGetCurrent() - startTime)
    }
    
    private func close(customerCount: Int, taskTime: Double) {
        let time = String(format: "%.2f", taskTime)
            
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(time)초입니다.")
    }
    
    private func receiveCustomers(customer: Queue<Customer>) {
        let firstNumber = 1
        for number in firstNumber...numberOfCustomer {
            guard let customerType = BusinessType.allCases.randomElement() else { return }
            let customer = Customer(waitingNumber: number, businessType: customerType)
            customerQueue.enqueue(data: customer)
        }
    }
    
    private func handleLoan(for customer: Customer,
                            group: DispatchGroup,
                            semaphore: DispatchSemaphore) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            window.doTask(customer: Customer(waitingNumber: customer.waitingNumber,
                                             businessType: customer.businessType))
            semaphore.signal()
        }
    }
}
