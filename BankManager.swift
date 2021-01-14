//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var customerList: [Customer] = []
    private var bankclerks: [BankClerk] = []
    private var numberOfCustomer: Int = 0
    private let assignedBankClerk = 3
    
    mutating private func writeBanKClerkList() {
        for bankWindowNumber in 1...assignedBankClerk {
            bankclerks.append(BankClerk(bankWindowNumber: bankWindowNumber))
        }
    }
    
    mutating private func writeCustomerList() {
        for waitingNumber in 1...countTodayCustomer() {
            guard let customerClass: Customer.Grade = Customer.Grade.allCases.randomElement(), let customerTask: TaskType = TaskType.allCases.randomElement() else {
                return
            }
            customerList.append(Customer(waitingNumber: waitingNumber, grade: customerClass, task: customerTask))
        }
    }
    
    mutating private func distributeCustomer() {
        var isContinue = true
        let group = DispatchGroup()
        
        while isContinue {
            for bankclerk in bankclerks {
                if bankclerk.isWorking == false {
                    if customerList.count == 0 {
                        isContinue = false
                        break
                    }
                    let customer = customerList.removeFirst()
                    bankclerk.serveCustomers(customer: customer, group: group)
                    self.numberOfCustomer += 1
                }
            }
        }
        group.wait()
    }
    
    mutating func openBank() {
        writeBanKClerkList()
        writeCustomerList()
        let startTime = DispatchTime.now()
        customerList.sort()
        distributeCustomer()
        let endTime = DispatchTime.now()
        let taskedTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1000
        BankerMessage.printCloseBankText(customers: numberOfCustomer, taskedTime: Double(taskedTime))
    }
    
    private func countTodayCustomer() -> Int {
        let customers = Int.random(in: 10...30)
        return customers
    }
}
