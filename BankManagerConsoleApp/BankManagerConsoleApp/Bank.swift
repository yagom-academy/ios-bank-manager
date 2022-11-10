//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

import Foundation

struct Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var depositBankerQueue: Queue<Banker> = Queue()
    private var loanBankerQueue: Queue<Banker> = Queue()
    private var totalCustomerCount: Int = 0
    private var totalTime: Double = 0
    private var bankers: [Banker] = []
    
    mutating func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func addBanker(_ bankers: [Banker]) {
        self.bankers += bankers
        
        for banker in bankers {
            switch banker.bankBusiness {
            case .deposit:
                depositBankerQueue.enqueue(banker)
            case .loan:
                loanBankerQueue.enqueue(banker)
            }
        }
    }
    
    mutating func startBankBusiness() {
        while customerQueue.isEmpty == false {
            for banker in bankers {
                guard let customer = customerQueue.dequeue() else {
                    break
                }
                banker.processBankingBusiness(of: customer)
                self.totalCustomerCount += 1
                self.totalTime += banker.processingTimePerCustomer
            }
        }
        printClosingMessage()
    }
    
    private mutating func printClosingMessage() {
        let formattedProcessedTotalTime: String = String(format: "%.2f", totalTime)
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        print(processingClosedMessage)
    }
}
