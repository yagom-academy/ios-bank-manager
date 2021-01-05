//
//  Window.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

class Window {
    private let number: Int
    private var banker: Banker?
    private var customer: Customer?
    
    init(windowNumber: Int) {
        self.number = windowNumber
    }
    
    // MARK: - set property
    func setBanker(_ banker: Banker) {
        self.banker = banker
    }
    
    func setCustomer(_ customer: Customer) {
        self.customer = customer
    }
    
    // MARK: - check func
    func checkEndCustomerTask(currentTime: Double) throws -> Bool {
        guard let assignedBanker = banker else {
            throw BankError.invalidateBanker
        }
        if try assignedBanker.canEndTask(currentTime) {
            try endCustomerTask()
            return true
        }
        return false
    }
    
    private func endCustomerTask() throws {
        guard let currentCustomer = customer else {
            throw BankError.invalidateCustomer
        }
        print(currentCustomer.endMessage)
        customer = nil
    }
    
    func isEmptyWindowCustomer() -> Bool {
        return customer == nil
    }
    
    func startCustomerTask(currentTime: Double, customer: Customer) throws {
        guard let assignedBanker = banker else {
            throw BankError.invalidateBanker
        }
        var nextBanker = assignedBanker
        nextBanker.setTaskStartTime(currentTime)
        banker = nextBanker
        self.customer = customer
        print(customer.startMessage)
    }
}
