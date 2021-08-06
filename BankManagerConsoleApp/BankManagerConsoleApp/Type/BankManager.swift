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
            judgeCustomer(group, loanSemaphore, depositSemaphore)
            totalCustomer += increaseOne
        }

        group.wait()
        close(customerCount: totalCustomer, taskTime: CFAbsoluteTimeGetCurrent() - startTime)
    }
    
    private func receiveCustomers(customer: Queue<Customer>) {
        let firstCustomerNumber = 1

        for number in firstCustomerNumber...numberOfCustomer {
            guard let customerType = BusinessType.allCases.randomElement() else { return }
            let customer = Customer(waitingNumber: number, businessType: customerType)
            customerQueue.enqueue(data: customer)
        }
    }
    
    private func judgeCustomer(_ group: DispatchGroup,
                               _ loanSemaphore: DispatchSemaphore,
                               _ depositSemaphore: DispatchSemaphore) {
        guard let customer = customerQueue.dequeue() else {
            return
        }
        
        if isLoan(of: customer) {
            handleLoan(for: customer, group: group, semaphore: loanSemaphore)
        } else {
            handleDeposit(for: customer, group: group, semaphore: depositSemaphore)
        }
    }
    
    private func isLoan(of customer: Customer) -> Bool {
        return customer.businessType == .loan
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
    
    private func handleDeposit(for customer: Customer,
                               group: DispatchGroup,
                               semaphore: DispatchSemaphore) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            window.doTask(customer: Customer(waitingNumber: customer.waitingNumber,
                                             businessType: customer.businessType))
            semaphore.signal()
        }
    }
    
    private func close(customerCount: Int, taskTime: Double) {
        let time = String(format: "%.2f", taskTime)
            
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(time)초입니다.")
    }
}
