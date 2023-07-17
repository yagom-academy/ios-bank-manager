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
        let depositClerk1 = DispatchQueue(label: "depositClerk1")
        let depositClerk2 = DispatchQueue(label: "depositClerk2")
        let loanClerk = DispatchQueue(label: "loanClerk")
        
        while self.customers.peek != nil {
            depositClerk1.async(group: group) {
                guard self.customers.peek?.task == .deposit, !self.customers.isEmpty else {
                    return
                }
                
                semaphore.wait()
                let customer = self.customers.dequeue()
                semaphore.signal()
                print("deposit1: \(customer!.numberTicket)번 고객 \(customer!.task.information.title)업무 시작")
                Thread.sleep(forTimeInterval: customer!.task.information.time)
                print("deposit1: \(customer!.numberTicket)번 고객 \(customer!.task.information.title)업무 완료")
                
            }
            
            depositClerk2.async(group: group) {
                guard self.customers.peek?.task == .deposit, !self.customers.isEmpty else {
                    return
                }
                
                semaphore.wait()
                let customer = self.customers.dequeue()
                semaphore.signal()
                print("deposit2: \(customer!.numberTicket)번 고객 \(customer!.task.information.title)업무 시작")
                Thread.sleep(forTimeInterval: customer!.task.information.time)
                print("deposit2: \(customer!.numberTicket)번 고객 \(customer!.task.information.title)업무 완료")

            }
        
            loanClerk.async(group: group) {
                guard self.customers.peek?.task == .loan, !self.customers.isEmpty else {
                    return
                }
                
                semaphore.wait()
                let customer = self.customers.dequeue()
                semaphore.signal()
                print("loan: \(customer!.numberTicket)번 고객 \(customer!.task.information.title)업무 시작")
                Thread.sleep(forTimeInterval: customer!.task.information.time)
                print("loan: \(customer!.numberTicket)번 고객 \(customer!.task.information.title)업무 완료")
            }
        }
        
        group.wait()
//        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bankManagers[0].totalCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", bankManagers[0].totalTaskTime))초 입니다.")

    }
}
