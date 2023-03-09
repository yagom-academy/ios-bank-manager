//
//  BankWorkable.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

protocol BankWorkable {
    var bankDispatchQueue: DispatchQueue { get }
    var businessType: BusinessType { get }
    var bankSemaphore: DispatchSemaphore { get }
}

extension BankWorkable {
    func work(for customer: Customer) {
        bankDispatchQueue.async {
            bankSemaphore.wait()
            print("\(customer.waitingNumber)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: customer.consultingTime)
            print("\(customer.waitingNumber)번 고객 업무 완료")
            bankSemaphore.signal()
        }
    }
}
