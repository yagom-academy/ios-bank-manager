//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/15/23.
//

import Foundation
import BankManager

struct Bank {
struct Bank: BankBusinesable {
    let bankManager = BankManager<BankClerk>()
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
}
