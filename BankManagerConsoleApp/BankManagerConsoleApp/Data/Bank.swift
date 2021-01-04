//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Bank {
    private var bankers: [Banker] = []
    private var customers: [Customer] = []
    
    private var totalProcessedCustomersNumber: Int = 0
    private var totalBusinessHours: Double = 0
    
    private let processingTime = 0.7
    private let zeroAmount = 0
    
    // MARK: - init func
    init(bankersNumber: Int) {
        initTotalAmount()
        initBanker(bankersNumber)
    }
    
    private func initTotalAmount() {
        totalProcessedCustomersNumber = zeroAmount
        totalBusinessHours = Double(zeroAmount)
    }
    
    private func initBanker(_ number: Int) {
        for windowNumber in 1...number {
            bankers.append(Banker(windowNumber: windowNumber, processingTime: processingTime))
        }
    }
    
    private func initCustomer(_ number: Int) {
        for waitingNumber in 1...number {
            customers.append(Customer(waitingNumber: waitingNumber))
        }
    }
    
    func openBank(customersNumber: Int) {
        initTotalAmount()
        initCustomer(customersNumber)
    }
    
    func closeBank() {
        
    }
}
