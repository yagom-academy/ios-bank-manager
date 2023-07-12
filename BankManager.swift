//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func carryOutBankService(_ waitingNumber: Int) {
        startTask(waitingNumber)
        Thread.sleep(forTimeInterval: 0.7)
        endTask(waitingNumber)
    }
    
    private func startTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 시작")
    }
    
    private func endTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 완료")
    }
}
