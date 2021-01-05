//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Bank {
    private var windows: [Window] = []
    private var waitingCustomers = Queue<Customer>()
    private var time: Double = 0
    private var processedCustomersNumber: Int = 0
    
    // MARK: - init func
    init(windowNumber: Int, bankersNumber: Int, bankersProcessingTime: Double) {
        initWindow(windowNumber)
        initBankers(number: bankersNumber, processingTime: bankersProcessingTime)
    }
    
    private func initWindow(_ number: Int) {
        for windowNumber in 1...number {
            windows.append(Window(windowNumber: windowNumber))
        }
    }
    
    private func initBankers(number: Int, processingTime: Double) {
        windows = windows.map({ (window: Window) -> Window in
            window.setBanker(Banker(processingTime: processingTime))
            return window
        })
    }
    
    private func resetRocord() {
        time = 0
        processedCustomersNumber = 0
    }
    
    private func addWaitingCustomer(_ number: Int) {
        for waitingNumber in 1...number {
            waitingCustomers.enqueue(Customer(waitingNumber: waitingNumber, taskAmount: 1))
        }
    }
    
    // MARK: - open close func
    func openBank(customersNumber: Int) {
        resetRocord()
        addWaitingCustomer(customersNumber)
    }
    
    func closeBank() {
        
    }
}
