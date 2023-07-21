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
        
        startTask(customer.waitingNumber, workType.name)
        Thread.sleep(forTimeInterval: workType.taskTime)
        endTask(customer.waitingNumber, workType.name)
    }
    
    private static func startTask(_ waitingNumber: Int, _ workName: String) {
        print("\(waitingNumber)번 고객 \(workName)업무 시작")
    }
    
    private static func endTask(_ waitingNumber: Int, _ workName: String) {
        print("\(waitingNumber)번 고객 \(workName)업무 완료")
    }
}
