//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation
import CustomerPackage

enum BankClerk {
    static func carryOutBankService(for customer: Customer) {
        guard let workType = customer.workType else { return }
        
        startTask(customer)
        Thread.sleep(forTimeInterval: workType.taskTime)
        endTask(customer)
    }
    
    private static func startTask(_ customer: Customer) {
        NotificationCenter.default.post(name: NSNotification.Name.workStart, object: nil, userInfo: ["고객": customer])
    }
    
    private static func endTask(_ customer: Customer) {
        NotificationCenter.default.post(name: NSNotification.Name.workEnd, object: nil, userInfo: ["고객": customer])
    }
}
