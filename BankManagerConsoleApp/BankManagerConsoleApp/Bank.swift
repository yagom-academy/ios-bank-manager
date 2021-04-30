//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/04/27.
//

import Foundation

struct Bank {
    var totalCustomer: Int = 0
    var waitingQueue: OperationQueue = OperationQueue()
    var numberOfTeller: Int
    var time: Double = 0
    
    private enum NumberOfCustomer {
        static let minimum: Int = 10
        static let maximum: Int = 30
    }
    
    init(_ numberOfTeller: Int) {
        self.numberOfTeller = numberOfTeller
    }
    
    private func totalProcessedTime(_ closure: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        closure()
        let processedTime = CFAbsoluteTimeGetCurrent() - startTime
        return processedTime
    }
    
    mutating func open() {
        assignTeller()
        time = totalProcessedTime {
            visitNewCustomer()
        }
        close()
    }
    
    private func close() {
        let totalProcessedTime = floor(time * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer) 명이며, 총 업무 시간은 \(totalProcessedTime)초입니다.")
    }
    
    func assignTeller() {
        waitingQueue.maxConcurrentOperationCount = numberOfTeller
    }
    
    @discardableResult
    mutating func visitNewCustomer() -> [Customer] {
        var customers: [Customer] = []
        totalCustomer = Int.random(in: NumberOfCustomer.minimum...NumberOfCustomer.maximum)
        
        for waitingNumber in 1...totalCustomer {
            customers.append(Customer(waitingNumber))
        }
        
        waitingQueue.addOperations(customers, waitUntilFinished: true)
        return customers
    }
}

