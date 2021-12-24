//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

class BankClerk {
    weak var bank: Bank?
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
    
