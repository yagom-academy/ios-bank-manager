//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

protocol BankClerkDelegate: AnyObject {
    func moveToProcessingState(of customer: Customer)
    func moveToCompletionState(of customer: Customer)
}

class BankClerk {
    private weak var delegate: BankClerkDelegate?
    
    init(delegatee: BankClerkDelegate) {
        self.delegate = delegatee
    }
    
    func work(with customer: Customer) {
        let workGroup = DispatchGroup()
        
        workGroup.enter()
        self.processWork(of: customer, group: workGroup)
        workGroup.leave()
        
        workGroup.wait()
    }
    
    private func processWork(of customer: Customer, group: DispatchGroup) {
        delegate?.moveToProcessingState(of: customer)
        group.wait(timeout: .now() + customer.task.processingTime)
        delegate?.moveToCompletionState(of: customer)
    }
}
