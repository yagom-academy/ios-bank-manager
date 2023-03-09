//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//
import Foundation

final class Bank {
    private var depositCustomerQueue: CustomerQueue<Customer> = CustomerQueue()
    private var loanCustomerQueue: CustomerQueue<Customer> = CustomerQueue()
    
    private let loanBankers: [Banker]
    private let depositBankers: [Banker]
    private(set) var totalCustomer: Int = 0
    
    init(loanBankers: [Banker], depositBankers: [Banker]) {
        self.loanBankers = loanBankers
        self.depositBankers = depositBankers
    }
    
    func open() {
        receiveCustomer()
        orderWork()
    }
    
    private func receiveCustomer() {
        let customerRange: ClosedRange<Int> = 10...30
        totalCustomer = Int.random(in: customerRange)
        
        for number in 1...totalCustomer {
            guard let business = Business.allCases.randomElement() else { return }
            let numberTicket = String(describing: number)
            let customer = Customer(numberTicket: numberTicket, business: business)
            
            switch customer.business {
            case .loan:
                loanCustomerQueue.enqueue(customer)
            case .deposit:
                depositCustomerQueue.enqueue(customer)
            }
        }
    }
    
    // 동시성 추가
    private func orderWork() {
        let loanWorkQueue = DispatchQueue(label: "loanWorkDispatchQueue")
        let depositWorkQueue = DispatchQueue(label: "depositWorkDispatchQueue")
        let workGroup = DispatchGroup()
        let loanWorkItem = DispatchWorkItem {
            while self.loanCustomerQueue.isEmpty == false {
                self.loanBankers.forEach { banker in
                    let customer = self.loanCustomerQueue.dequeue()
                    
                    loanWorkQueue.async(group: workGroup) {
                        banker.doWork(for: customer)
                    }
                }
            }
        }
        let depositWorkItem = DispatchWorkItem {
            while self.depositCustomerQueue.isEmpty == false {
                self.depositBankers.forEach{ banker in
                    let customer = self.depositCustomerQueue.dequeue()
                    
                    depositWorkQueue.async(group: workGroup) {
                        banker.doWork(for: customer)
                    }
                }
            }
        }
        
//        loanWorkQueue.async(group: workGroup, execute: loanWorkItem)
//        depositWorkQueue.async(group: workGroup, execute: depositWorkItem)
        DispatchQueue.global().async(group: workGroup, execute: loanWorkItem)
        DispatchQueue.global().async(group: workGroup, execute: depositWorkItem)
            
        workGroup.wait()
        reportResult()
    }
    
    // processTime 수정
    func reportResult() {
//        let totalProcessTime = Double(totalCustomer) * Banker.processTime
        let message = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(10)초 입니다."
        print(message)
    }
}
