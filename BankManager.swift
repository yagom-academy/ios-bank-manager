//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var customerList: [Customer] = []
    var bankclerks: [BankClerk] = []
    var currentNumber: Int = 0
    
    mutating func writeBanKClerkList() {
        for windowNumber in 1...3 {
            bankclerks.append(BankClerk(windowNumber: windowNumber))
        }
    }
    
    mutating func writeCustomerList() {
        for waitingNumber in 1...countTodayCustomer() {
            guard let customerClass: Customer.Class = Customer.Class.allCases.randomElement(), let customerTask: TaskType = TaskType.allCases.randomElement() else {
                return
            }
            customerList.append(Customer(waitingNumber: waitingNumber, customerClass: customerClass, task: customerTask))
        }
    }
    
    mutating func distributeCustomer() {
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
                    self.currentNumber += 1
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
        BankerMessage.printCloseBankText(customers: currentNumber, taskedTime: Double(taskedTime))
    }
    
    func countTodayCustomer() -> Int {
        let customers = Int.random(in: 10...30)
        return customers
    }
}
