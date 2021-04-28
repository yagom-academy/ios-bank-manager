//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/04/27.
//

import Foundation

struct Bank {
    var teller: Teller
    var totalCustomer: Int = 0
    var waitingQueue = WaitingQueue()
    var totalProcessedTime: CFAbsoluteTime = 0
    
    init(teller: Teller) {
        self.teller = teller
    }
    
    mutating func open() {
        // 텔러 업무 처리
        totalProcessedTime = 0
        visitNewCustomer()

        while !waitingQueue.queue.isEmpty {
            let nextCustomer: Result = waitingQueue.dequeue()
            
            switch nextCustomer {
            case .success(let customer):
                totalProcessedTime += teller.processTask(for: customer.waitingNumber)
            case .failure(let error):
                print(error)
            }
        }
        
        close()
    }
    
    private func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer) 명이며, 총 업무 시간은 \(round(totalProcessedTime * 100) / 100)초입니다.")
    }
    
    mutating private func visitNewCustomer() {
        totalCustomer = Int.random(in: 10...30)
        
        for waitingNumber in 1...totalCustomer {
            let customer = Customer(waitingNumber: waitingNumber)
            waitingQueue.enqueue(customer)
        }
    }
}
