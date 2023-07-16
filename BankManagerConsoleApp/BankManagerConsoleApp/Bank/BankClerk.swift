//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation

struct BankClerk {
    private let workType: WorkType
    private let semaphore: DispatchSemaphore
    
    init(workType: WorkType) {
        self.workType = workType
        self.semaphore = DispatchSemaphore(value: workType.numberOfBankClerk)
    }
    
    func carryOutBankService(for customer: Customer, of group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            
            startTask(customer.waitingNumber)
            Thread.sleep(forTimeInterval: workType.taskTime)
            endTask(customer.waitingNumber)
            
            semaphore.signal()
        }
    }
    
    private func startTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 \(workType.name)업무 시작")
    }
    
    private func endTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 \(workType.name)업무 완료")
    }
}
