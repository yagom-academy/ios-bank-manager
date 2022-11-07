//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

import Foundation

struct Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var bankers: [Banker] = []
    private var totalCustomerNumber: Int = 0
    private var totalTime: Double = 0
    private var formattedProcessedTotalTime: String {
        return String(format: "%.2f", totalTime)
    }
    
    mutating func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func addBanker(_ banker: Banker) {
        
        
        bankers.append(banker)
    }
    
    private mutating func printClosingMessage() {
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        print(processingClosedMessage)
    }
    
    mutating func startBankBusiness() {
        while customerQueue.isEmpty == false {
            for banker in bankers {
                guard let customer = customerQueue.dequeue() else {
                    break
                }
                banker.processBankingBusiness(of: customer)
                self.totalCustomerNumber += 1
                self.totalTime += banker.processingTimePerCustomer
            }
        }
        printClosingMessage()
    }
}
