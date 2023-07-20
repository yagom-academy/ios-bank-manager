//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//
import Foundation

class Bank {
    private let bankers: [Banker]
    private var depositQueue: CustomerQueue<Customer> = CustomerQueue()
    private var loanQueue: CustomerQueue<Customer> = CustomerQueue()
    private var finishedCustomerCount: Int = .zero
    private var totalWorkTime: Double = .zero
    private let group = DispatchGroup()
    
    init(bankers: [Banker]) {
        self.bankers = bankers
    }
    
    private func lineUp(_ customers: inout [Customer]) {
        for number in 0..<customers.count {
            customers[number].receiveQueueNumber(queueNumber: number + 1)
            
            switch customers[number].task {
            case .deposit:
                depositQueue.enqueue(customers[number])
            case .loan:
                loanQueue.enqueue(customers[number])
            }
        }
    }
    
    func startBankService(_ customers: inout [Customer]) {
        lineUp(&customers)
        
        let firstDepositWindow = DispatchWorkItem { [self] in
            while let depositCustomer = depositQueue.dequeue() {
                bankers[0].work(for: depositCustomer)
                countFinishedCustomer()
                checkWorkTime(from: bankers[0])
            }
        }
        
        let secondDepositWindow = DispatchWorkItem { [self] in
            while let depositCustomer = depositQueue.dequeue() {
                bankers[1].work(for: depositCustomer)
                countFinishedCustomer()
                checkWorkTime(from: bankers[1])
            }
        }
        
        let firstLoanWindow = DispatchWorkItem { [self] in
            while let loanCustomer = loanQueue.dequeue() {
                bankers[2].work(for: loanCustomer)
                countFinishedCustomer()
                checkWorkTime(from: bankers[2])
            }
        }
        
        DispatchQueue.global().async(group: group, execute: firstDepositWindow)
        DispatchQueue.global().async(group: group, execute: secondDepositWindow)
        DispatchQueue.global().async(group: group, execute: firstLoanWindow)
        
        group.wait()
        workFinish()
    }
    
    private func countFinishedCustomer() {
        finishedCustomerCount += 1
    }
    
    private func checkWorkTime(from banker: Banker) {
        totalWorkTime += banker.notifyWorkTime()
    }
    
    private func workFinish() {
        let totalWorkTime = String(format: "%.2f", totalWorkTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(finishedCustomerCount)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
