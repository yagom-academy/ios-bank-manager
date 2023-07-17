//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

import Foundation

class Bank {
    private var customers = Queue<Customer>()

    init() {
        let randomRange = 1...Int.random(in: 10...30)
        randomRange.forEach { numberTicket in
            customers.enqueue(Customer(numberTicket))
        }
    }
    
    func start() {
            let group = DispatchGroup()
            let semaphore = DispatchSemaphore(value: 1)
            var doneCustomers: Set<Int> = []
            let depositClerk1 = DispatchQueue(label: "depositClerk1")
            let depositClerk2 = DispatchQueue(label: "depositClerk2")
            let loanClerk = DispatchQueue(label: "loanClerk")
            
            func depositWork(customer: Customer) -> DispatchWorkItem {
                return DispatchWorkItem {
                    semaphore.wait()
                    if !doneCustomers.contains(customer.numberTicket) {
                        doneCustomers.insert(customer.numberTicket)
                        semaphore.signal()
                        print("\(customer.numberTicket)번 고객 \(customer.task.information.title)업무 시작")
                        Thread.sleep(forTimeInterval: customer.task.information.time)
                        print("\(customer.numberTicket)번 고객 \(customer.task.information.title)업무 완료")
                    }
                    semaphore.signal()
                }
            }
            
            func loanWork(customer: Customer) -> DispatchWorkItem {
                return DispatchWorkItem {
                    print("\(customer.numberTicket)번 고객 \(customer.task.information.title)업무 시작")
                    Thread.sleep(forTimeInterval: customer.task.information.time)
                    print("\(customer.numberTicket)번 고객 \(customer.task.information.title)업무 완료")
                }
            }
            
            while let customer = self.customers.dequeue() {
                switch customer.task {
                case .deposit:
                    depositClerk1.async(group: group, execute: depositWork(customer: customer))
                    depositClerk2.async(group: group, execute: depositWork(customer: customer))
                case .loan:
                    loanClerk.async(group: group, execute: loanWork(customer: customer))
                }
            }
        
            group.wait()
    //        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bankManagers[0].totalCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", bankManagers[0].totalTaskTime))초 입니다.")
    }
}
