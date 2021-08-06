//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

protocol Clerkable {
    var bankType: TaskType { set get }
    func serveBanking(for client: Clientable, notifyEnd: @escaping (Clerkable) -> Void)
}

struct BankClerk: Clerkable {
    var bankType: TaskType
    func serveBanking(for client: Clientable, notifyEnd: @escaping (Clerkable) -> Void) {
        print("\(client.waitingNumber)번 고객 \(client.bankType.rawValue) 업무 시작")
        Thread.sleep(forTimeInterval: bankType.workingTime)
        print("\(client.waitingNumber)번 고객 \(client.bankType.rawValue) 업무 종료")
        notifyEnd(self)
    }
}
