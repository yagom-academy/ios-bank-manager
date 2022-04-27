//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
import Foundation

struct BankClerk {
    func work(client: Client) {
        DispatchQueue.global().sync {
            print("\(client.number)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(client.number)번 고객 업무 완료")
        }
    }
}
