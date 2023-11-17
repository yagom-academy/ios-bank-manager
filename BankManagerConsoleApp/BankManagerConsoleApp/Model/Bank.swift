//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/15/23.
//

import Foundation
import BankManager

struct Bank: BankBusinesable {
    private let bankManager = BankManager<BankClerk>()
    private let bankClerk = BankClerk()
    private let customerNumber: UInt
    
    init(customerNumber: UInt) {
        self.customerNumber = customerNumber
    }
    
    func open() {
        createCustomer(customerNumber: customerNumber)
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        bankManager.assignCustomer(to: bankClerk)
        
        let finishTime = CFAbsoluteTimeGetCurrent() - startTime
        let time = String(format: "%.2f", finishTime)
        
        close(time: time)
    }
    
    private func createCustomer(customerNumber: UInt) {
        (1...customerNumber).forEach {
            bankManager.standBy(customer: Customer(number: $0))
        }
    }
    
    private func close(time: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(time)초입니다.")
    }
}
