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
    
    func work(with customer: Customer) {
        let workGroup = DispatchGroup()
        
        workGroup.enter()
        self.processWork(of: customer, group: workGroup)
        workGroup.leave()
        
        workGroup.wait()
    }
    
    private func processWork(of customer: Customer, group: DispatchGroup) {
        delegate?.printBeginWorkMessage(of: customer)
        group.wait(timeout: .now() + customer.task.processingTime)
        delegate?.printFinishWorkMessage(of: customer)
    }
}
