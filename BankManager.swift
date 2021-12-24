//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
        self.bank.delegate = self
        self.bank.bankClerk.delegate = self
        setupCustomerQueue()
    }
    
    private func setupCustomerQueue() {
        let randomCustomerCount: Int = Int.random(in: 10...30)
        
        (1...randomCustomerCount).forEach { number in
            bank.customerQueue.enqueue(value: Customer(turn: number))
        }
    }
    
    func openBank() {
        bank.open()
    }
}

extension BankManager: BankDelegate {
    func printClosingMessage(customers: Int, processingTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(processingTime.formatted)초입니다.")
    }
}

extension BankManager: BankClerkDelegate {
    func printBeginWorkMessage(of customer: Customer) {
        print("\(customer.turn)번 고객 업무 시작")
    }
    
    func printFinishWorkMessage(of customer: Customer) {
        print("\(customer.turn)번 고객 업무 완료")
    }
}
