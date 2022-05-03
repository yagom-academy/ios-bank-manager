//
//  Clerkable.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana on 2022/05/03.
//

import Foundation

protocol Clerkalbe { }

extension Clerkalbe {
    func work(client: Client, group: DispatchGroup) {
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
