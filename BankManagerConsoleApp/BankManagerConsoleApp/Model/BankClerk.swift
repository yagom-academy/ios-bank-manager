//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

protocol BankClerkDelegate {
    func printBeginWorkMessage(of customer: Customer)
    func printFinishWorkMessage(of customer: Customer)
}

class BankClerk {
    weak var bank: Transactionable?
    var delegate: BankClerkDelegate?
    
    func work() {
        var customerCount: Int = 0
        var totalProcessingTime: Double = 0
        
        while let customer = bank?.customerQueue.dequeue() {
            processWork(of: customer)
            customerCount += 1
            totalProcessingTime += customer.processingTime
        }
        
        bank?.close(totalCustomers: customerCount, totalProcessingTime: totalProcessingTime)
    }
    
    private func processWork(of customer: Customer) {
        delegate?.printBeginWorkMessage(of: customer)
        Thread.sleep(forTimeInterval: TimeInterval(customer.processingTime))
        delegate?.printFinishWorkMessage(of: customer)
    }
}
    
