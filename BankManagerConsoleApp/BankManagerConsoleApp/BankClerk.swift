//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

struct BankClerk: Clerk {
    var bankType: BankType
    
    func serveBanking(for client: BankClient, notifyEnd: @escaping (BankClerk) -> Void) {
        print("\(client.waitingNumber)번 고객 \(client.bankType.rawValue) 업무 시작")
        Thread.sleep(forTimeInterval: bankType.workingTime)
        print("\(client.waitingNumber)번 고객 \(client.bankType.rawValue) 업무 종료")
        notifyEnd(self)
    }
}
