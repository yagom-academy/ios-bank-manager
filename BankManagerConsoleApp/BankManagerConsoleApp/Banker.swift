//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

struct Banker {
    static let requiredTime: Double = 0.7
    
    func receive(client: BankClient) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: Banker.requiredTime)
        print("\(client.waitingNumber)번 고객 업무 완료")
    }
}
