//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

import Foundation

struct BankClerk {
    func work(bank: Bank) {
        DispatchQueue.global().sync {
            let client = bank.clients.peek()!
            print("\(client.number)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(client.number)번 고객 업무 완료")
            _ = bank.clients.dequeue()
        }
    }
}
