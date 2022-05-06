//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.

import Foundation

private enum SemaphoreValue {
    static let deposit = 2
    static let loan = 1
}

enum BankClerk {
    
    static let depositClerks = DispatchSemaphore(value: SemaphoreValue.deposit)
    static let loanClerks = DispatchSemaphore(value: SemaphoreValue.loan)
    static let bankWindows = DispatchQueue(label: "bankWindows", attributes: .concurrent)
    
    static func work(client: Client, group: DispatchGroup) {
        let semaphore = client.task.clerk
        semaphore.wait()
        bankWindows.async(group: group) {
            print("\(client.waitingNumber)번 고객 \(client.task.rawValue)업무 시작")
            Thread.sleep(forTimeInterval: client.task.time)
            print("\(client.waitingNumber)번 고객 \(client.task.rawValue)업무 완료")
            semaphore.signal()
        }
    }
}
