//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

struct Banker {
    private init() {}
    
    static func receive(client: BankClient) {
        print("\(client.waitingNumber)번 고객 \(client.businessType.rawValue)업무 시작")
        Thread.sleep(forTimeInterval: client.businessType.time)
        print("\(client.waitingNumber)번 고객 \(client.businessType.rawValue)업무 완료")
    }
}
