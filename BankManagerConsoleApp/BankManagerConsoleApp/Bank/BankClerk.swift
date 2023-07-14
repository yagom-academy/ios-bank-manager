//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation

struct BankClerk {
    let workType: WorkType
    
    func carryOutBankService(for customer: Customer) {
        startTask(customer.waitingNumber)
        Thread.sleep(forTimeInterval: workType.taskTime)
        endTask(customer.waitingNumber)
    }
    
    private func startTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 시작")
    }
    
    private func endTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 완료")
    }
}
