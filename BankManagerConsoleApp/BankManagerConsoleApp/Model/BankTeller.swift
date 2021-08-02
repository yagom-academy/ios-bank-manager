//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankTeller {
    let processingTime: Double = 0.7
    
    func serve(_ client: Client, completion: (Double) -> Void) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(client.waitingNumber)번 고객 업무 완료")
        completion(processingTime)
    }
}
