//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, tottale on 11/3/22.
//
import Foundation

struct Bank {
    var clerks: [Workable]
    let customerQueue = Queue<Customer>()
    let loanQueue = Queue<Customer>()
    let depositQueue = Queue<Customer>()
    var customerCount: Int = 0
    
    init(clerkCount: Int, loanClerkCount: Int) {
        self.clerks = Array(repeating: LoanClerk(), count: loanClerkCount)
        self.clerks.append(contentsOf: Array(repeating: DepositClerk(), count: clerkCount - loanClerkCount))
    }
    
    func endWork(_ timeInterval: TimeInterval) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(timeInterval.formattedNumber)초입니다.")
    }
    
    func open() {
        let startTime = CFAbsoluteTimeGetCurrent()
        manageCustomerQueue()
        serve()
        let endTime = CFAbsoluteTimeGetCurrent()
        let timeInterval = endTime - startTime
        endWork(timeInterval)
    }
    
    func manageCustomerQueue() {
        while let customer = customerQueue.dequeue() {
            switch customer.serviceType {
            case .deposit:
                depositQueue.enqueue(customer)
                
            case .loan:
                loanQueue.enqueue(customer)
                
            }
        }
    }
    
    func serve() {
        let group = DispatchGroup()
        
        clerks.forEach { clerk in
            switch clerk.service {
            case .loan:
                DispatchQueue.global().async(group: group, execute: clerk.scheduleWork(from: loanQueue))
            case .deposit:
                DispatchQueue.global().async(group: group, execute: clerk.scheduleWork(from: depositQueue))
            }
        }

        group.wait()
    }
    
    func close() {}
}
