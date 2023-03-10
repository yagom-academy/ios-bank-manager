//
//  BankWorkable.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

protocol BankWorkable {
    var bankDispatchQueue: DispatchQueue { get }
    var bankSemaphore: DispatchSemaphore { get }
    var businessType: BusinessType { get }
    var completedJobCount: Int { get set }
}

extension BankWorkable {
    func processJob(for customer: Customer, group: DispatchGroup) {
        bankDispatchQueue.async(group: group) {
            self.bankSemaphore.wait()
            print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 시작")
            Thread.sleep(forTimeInterval: customer.consultingTime)
            print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 완료")
            self.bankSemaphore.signal()
        }
    }
    
    mutating func addJobCount() {
        completedJobCount += 1
    }
}
