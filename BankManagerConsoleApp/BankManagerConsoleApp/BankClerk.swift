//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

struct BankClerk: Clerk {
    var workTime: Double = 0.7
    
    func serveBanking(for client: BankClient) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: workTime)
        print("\(client.waitingNumber)번 고객 업무 종료")
    }
}
