//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

final class Bank {
    private var customerQueue: CustomerQueue<Customer> = CustomerQueue()
    private var totalCustomer: Int = 0
    
    private let loanSemaphore: DispatchSemaphore
    private let depositSemaphore: DispatchSemaphore
    private let workQueue: DispatchQueue = DispatchQueue(label: "workQueue", attributes: .concurrent)
    private let workGroup: DispatchGroup = DispatchGroup()
    
    init(loanBankerCount: Int, depositBankerCount: Int) {
        self.loanSemaphore = DispatchSemaphore(value: loanBankerCount)
        self.depositSemaphore = DispatchSemaphore(value: depositBankerCount)
    }
    
    func open() {
        receiveCustomer()
        let processTime = checkProcessTime(for: startWork)
        reportResult(processTime: processTime)
    }
    
    private func receiveCustomer() {
        let customerRange: ClosedRange<Int> = 10...30
        totalCustomer = Int.random(in: customerRange)
        
        for number in 1...totalCustomer {
            guard let business = Business.allCases.randomElement() else { return }
            let numberTicket = String(describing: number)
            let customer = Customer(numberTicket: numberTicket, business: business)
            customerQueue.enqueue(customer)
        }
    }
    
    private func checkProcessTime(for process: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return processTime
    }
    
    private func startWork() {
        while customerQueue.isEmpty == false {
            guard let customer = customerQueue.dequeue() else { return }
            respond(to: customer)
        }
        
        workGroup.wait()
    }

    private func respond(to customer: Customer) {
        switch customer.business {
        case .deposit:
            workQueue.async(group: workGroup) {
                self.depositSemaphore.wait()
                Banker.doWork(for: customer)
                self.depositSemaphore.signal()
            }
        case .loan:
            workQueue.async(group: workGroup) {
                self.loanSemaphore.wait()
                Banker.doWork(for: customer)
                self.loanSemaphore.signal()
            }
        }
    }
    
    private func reportResult(processTime: CFAbsoluteTime) {
        let roundedProcessTime = round(processTime * 100) / 100
        let message = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(roundedProcessTime)초 입니다."
        print(message)
    }
}
