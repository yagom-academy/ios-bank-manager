//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.

import Foundation

private enum ClerkCount {
    static let deposit = 2
    static let loan = 1
}

enum BankClerk {
    static let deposit = DispatchSemaphore(value: ClerkCount.deposit)
    static let loan = DispatchSemaphore(value: ClerkCount.loan)
    
    static func work(client: Client, group: DispatchGroup) {
        let semaphore = client.task.clerk
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            print("\(client.waitingNumber)번 고객 \(client.task.rawValue)업무 시작")
            Thread.sleep(forTimeInterval: client.task.time)
            print("\(client.waitingNumber)번 고객 \(client.task.rawValue)업무 완료")
            semaphore.signal()
        }
    }
}
