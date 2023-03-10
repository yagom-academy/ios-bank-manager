//
//  BankManager.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func work(client: Client) {
        print("\(client.clientWaitingNumber)번 고객 \(client.bankingTypeText)업무 시작")
        Thread.sleep(forTimeInterval: client.bankingTime)
        print("\(client.clientWaitingNumber)번 고객 \(client.bankingTypeText)업무 종료")
    }
}
