//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

protocol BankClerkDelegate: AnyObject {
    func printBeginWorkMessage(of customer: Customer)
    func printFinishWorkMessage(of customer: Customer)
}

class BankClerk {
    private weak var bank: BankTransactionable?
    private weak var delegate: BankClerkDelegate?
    
    init(delegatee: BankClerkDelegate) {        
        self.delegate = delegatee
    }
    
    func setBank(bank: BankTransactionable) {
        self.bank = bank
    }
    
    func work() {
        let bankWorkGroup = DispatchGroup()
        let bankWorkQueue = DispatchQueue(label: "BankWork")
        
        var customerCount: Int = 0
        var totalProcessingTime: Double = 0
        
        let bankWorkItem = DispatchWorkItem {
            guard let customer = self.bank?.dequeue() else {
                return
            }
            
            self.processWork(of: customer, group: bankWorkGroup)
            customerCount += 1
            totalProcessingTime += customer.task.processingTime
        }
        
        while bank?.isCustomerQueueEmpty() == false {
            bankWorkQueue.async(group: bankWorkGroup, execute: bankWorkItem)
        }
        
        bankWorkGroup.wait()
        
        bank?.close(totalCustomers: customerCount, totalProcessingTime: totalProcessingTime)
    }
    
    private func processWork(of customer: Customer, group: DispatchGroup) {
        delegate?.printBeginWorkMessage(of: customer)
        group.wait(timeout: .now() + customer.task.processingTime)
        delegate?.printFinishWorkMessage(of: customer)
    }
}
    
