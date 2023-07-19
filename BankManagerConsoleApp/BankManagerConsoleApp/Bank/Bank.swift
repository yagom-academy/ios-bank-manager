//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation

struct Bank {
    private let customerCount: Int
    private let depositBankClerk = BankClerk(workType: .deposit)
    private let loanBankClerk = BankClerk(workType: .loan)
    private var waitingLine: any CustomerQueueable = CustomerQueue()
    
    init(customerCount: Int) {
        self.customerCount = customerCount
    }
    
    func open() {
        updateWaitingLine()
        startBankService()
    }
    
    private func updateWaitingLine() {
        (1...customerCount).forEach {
            waitingLine.enqueue(Customer(waitingNumber: $0))
        }
    }
    
    private func startBankService() {
        let group = DispatchGroup()
        let startTime = Date()
        
        distributeWork(group)
        
        group.wait()
        
        let totalTaskTime = Date().timeIntervalSince(startTime)
        let formatTaskTime = String(format: "%.2f", totalTaskTime)
        
        finish(formatTaskTime)
    }
    
    private func distributeWork(_ group: DispatchGroup) {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue() else { return }
            
            switch currentCustomer.workType {
            case .deposit:
                depositBankClerk.carryOutBankService(for: currentCustomer, of: group)
            case .loan:
                loanBankClerk.carryOutBankService(for: currentCustomer, of: group)
            default:
                print("workType이 nil입니다.")
            }
        }
    }
    
    private func finish(_ taskTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(taskTime)초입니다.")
    }
}
