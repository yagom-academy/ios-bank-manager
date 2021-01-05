//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    static let shared = BankManager()
    private init() {}
    private var bank: Bank?
    private var time: Double = 0
    private var processedCustomersNumber: Int = 0
    private var bankTimer: Timer?
    private let timeInterval = 0.1
    
    func initBank(windowNumber: Int, bankersNumber: Int, bankersProcessingTime: Double) {
        bank = Bank(windowNumber: windowNumber, bankersNumber: bankersNumber, bankersProcessingTime: bankersProcessingTime)
        bank?.delegate = self
    }
    
    private func resetRecord() throws {
        time = 0
        bankTimer = nil
        processedCustomersNumber = 0
        guard let managedBank = bank else {
            throw BankError.emptyBank
        }
        managedBank.resetWaitingCustomers()
    }
    let runLoop = CFRunLoopGetMain()
    // MARK: - open close func
    func openBank(customersNumber: Int) throws {
        try resetRecord()
        guard let managedBank = bank else {
            throw BankError.emptyBank
        }
        managedBank.addWaitingCustomer(customersNumber)
        try managedBank.assignCustomer(time: time)
        bankTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            DispatchQueue.global().async {
                try? self.updateTime()
            }
        })
        CFRunLoopRun()
    }
    
    func updateTime() throws {
        time += timeInterval
        guard let managedBank = bank else {
            throw BankError.emptyBank
        }
        try managedBank.checkEndWindow(time: time)
        try managedBank.assignCustomer(time: time)
    }
    
     func closeBank(_ error: Error?) throws {
        bankTimer?.invalidate()
        CFRunLoopStop(runLoop)
    }
}

extension BankManager: BankDelegate {
    func close() {
        try? self.closeBank(nil)
    }
}
