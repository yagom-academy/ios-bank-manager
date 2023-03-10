//
//  BankManager.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func work(client: Int) {
        print("\(client)번 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(client)번 업무 완료")
    }
}
