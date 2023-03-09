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
        let loanWorkQueue = DispatchQueue.global()
        let depositWorkQueue = DispatchQueue.global()
        
        loanWorkQueue.async {
            while self.loanCustomerQueue.isEmpty == false {
                self.loanBankers.forEach { banker in
                    let customer = self.loanCustomerQueue.dequeue()
                    banker.doWork(for: customer)
                }
            }
        }
        
        depositWorkQueue.async {
            while self.depositCustomerQueue.isEmpty == false {
                self.depositBankers.forEach{ banker in
                    let customer = self.depositCustomerQueue.dequeue()
                    banker.doWork(for: customer)
                }
            }
        }
        
        
    }
    
    // processTime 수정
    func reportResult() {
//        let totalProcessTime = Double(totalCustomer) * Banker.processTime
//        let message = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalProcessTime)초 입니다."
//        print(message)
    }
}
