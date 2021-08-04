//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankTeller {
    let bankingTask: BankingTask
    
    func serve(_ client: Client, completion: () -> Void) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: bankingTask.processingTime)
        print("\(client.waitingNumber)번 고객 업무 완료")
        completion()
    }
}
