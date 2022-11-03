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
    private let processedCustomerNumber: Int = 0
    private let processedTotalTime: Double = 0
    
    mutating func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func addBanker(_ banker: Banker) {
        bankers.append(banker)
    }
    
    mutating func printClosingMesage() {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        guard let formattedProcessedTotalTime: String = numberFormatter.string(from: NSNumber(value: processedTotalTime)) else {
            return
        }
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomerNumber)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        
        print(processingClosedMessage)
    }
}
