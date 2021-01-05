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
    private var processedCustomersNumber: Int = 0
    private var currentTime: Double = 0.0
    private var bankTimer: Timer?
    private let timeInterval = 0.1
    private let runLoop = CFRunLoopGetMain()
    private let closeMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.1f초입니다."
    
    func initBank(windowNumber: Int, bankersNumber: Int, bankersProcessingTime: Double) {
        bank = Bank(windowNumber: windowNumber, bankersNumber: bankersNumber, bankersProcessingTime: bankersProcessingTime)
        bank?.delegate = self
    }
    
    private func resetRecord() throws {
        currentTime = 0.0
        bankTimer = nil
        processedCustomersNumber = 0
        guard let managedBank = bank else {
            throw BankError.emptyBank
        }
        managedBank.resetWaitingCustomers()
    }
    
    // MARK: - bank operate func
    func openBank(customersNumber: Int) throws {
        try resetRecord()
        guard let managedBank = bank else {
            throw BankError.emptyBank
        }
        managedBank.addWaitingCustomer(customersNumber)
        try managedBank.assignCustomer(time: currentTime)
        bankTimer = Timer.scheduledTimer(withTimeInterval: self.timeInterval, repeats: true, block: { _ in
            self.updateTime()
        })
        CFRunLoopRun()
    }
    
    func updateTime() {
        currentTime += timeInterval
        currentTime = currentTime.setPrecision()
        print("👋\(currentTime)")
        do {
            guard let managedBank = bank else {
                throw BankError.emptyBank
            }
            self.processedCustomersNumber += try managedBank.checkEndWindow(time: currentTime)
            try managedBank.assignCustomer(time: currentTime)
        } catch {
            self.showError(error)
        }
    }
    
     func closeBank() {
        bankTimer?.invalidate()
        CFRunLoopStop(runLoop)
        print(String(format: closeMessage, processedCustomersNumber, currentTime))
    }
    
    private func showError(_ error: Error) {
        let errorMessage: String
        if let bankError = error as? BankError {
            errorMessage = bankError.localizedDescription
        } else {
            errorMessage = BankError.unknow.localizedDescription
        }
        print(errorMessage)
        exitApp()
    }
    
    private func exitApp() {
        exit(1)
    }
}

extension BankManager: BankDelegate {
    func close() {
        self.closeBank()
    }
}
