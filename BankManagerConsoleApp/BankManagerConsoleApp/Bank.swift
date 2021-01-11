//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

class Bank {
    var customers: [Customer] = []
    private var bankManagers: [BankManager] = []
    var numberOfCustomer: Int?
    private var openTime: Date?
    private var closeTime: Date?
    private var totalTime: TimeInterval? {
        guard let openTime = openTime, let closeTime = closeTime else {
            return nil
        }
        let calculatedTime = TimeInterval(closeTime.timeIntervalSince(openTime))
        return calculatedTime
    }
    
    init(bankManagerNumber: Int) {
        self.initializeBankManagers(bankManagerNumber: bankManagerNumber)
    }
    
    private func initializeBankManagers(bankManagerNumber: Int) {
        for number in 1...bankManagerNumber {
            bankManagers.append(BankManager(number: number))
        }
    }
    
    func performBankTask() {
        assignCustomerToTeller()
        closeBank()
    }
    
    private func assignCustomerToTeller() {
        var isStillCustomerLeft: Bool = true
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 3)
        
        self.openTime = Date()
        while isStillCustomerLeft {
            for var bankTeller in self.bankManagers {
                if customers.count == 0 {
                    isStillCustomerLeft = false
                    break
                }
                if bankTeller.state == .notWorking {
                    let customer = customers.removeFirst()
                    bankTeller.queue.async() {
                        semaphore.wait()
                        bankTeller.performTask(customerNumber: customer.waitNumber, customerPriority: customer.priority, customerTask: customer.taskType, semaphore: semaphore)
                    }
                }
            }
        }
        self.closeTime = Date()
    }
    
    private func closeBank() {
        guard let totalNumberOfCustomer = numberOfCustomer, let businessTime = totalTime else {
            print(BankError.unknown.localizedDescription)
            return
        }
        print(String(format: "\(BankMessage.close)", totalNumberOfCustomer ,businessTime))
    }
}

