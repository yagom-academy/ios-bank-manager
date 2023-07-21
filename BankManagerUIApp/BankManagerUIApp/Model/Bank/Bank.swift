//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation
import CustomerPackage

struct Bank {
    private let customerCount: Int
    private var waitingLine: any CustomerQueueable = CustomerQueue()
    private let loanOperationQueue: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = WorkType.loan.numberOfBankClerk
        
        return operationQueue
    }()
    
    private let depositOperationQueue: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = WorkType.deposit.numberOfBankClerk
        
        return operationQueue
    }()
    
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
        let startTime = Date()
        
        distributeWork()
        
        depositOperationQueue.waitUntilAllOperationsAreFinished()
        loanOperationQueue.waitUntilAllOperationsAreFinished()
        
        let totalTaskTime = Date().timeIntervalSince(startTime)
        let formatTaskTime = String(format: "%.2f", totalTaskTime)
        
        finish(formatTaskTime)
    }
    
    private func distributeWork() {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue() else { return }
            let operation = BlockOperation { BankClerk.carryOutBankService(for: currentCustomer) }
            
            switch currentCustomer.workType {
            case .deposit:
                depositOperationQueue.addOperation(operation)
            case .loan:
                loanOperationQueue.addOperation(operation)
            default:
                print("workType이 nil입니다.")
            }
        }
    }
    
    private func finish(_ taskTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(taskTime)초입니다.")
    }
}
