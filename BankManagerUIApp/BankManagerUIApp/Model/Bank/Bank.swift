//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation
import CustomerPackage

struct Bank {
    private var issuedWaitingNumber: Int = 1
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
    
    mutating func addCustomer() -> [Customer] {
        var customerList: [Customer] = []
        (issuedWaitingNumber..<issuedWaitingNumber + 10).forEach {
            customerList.append(Customer(waitingNumber: $0))
        }
        issuedWaitingNumber += 10
        
        return customerList
    }
    
    func updateWaitingLine(_ customers: [Customer]) {
        customers.forEach {
            waitingLine.enqueue($0)
        }
        startBankService()
    }
    
    private func startBankService() {
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
}
