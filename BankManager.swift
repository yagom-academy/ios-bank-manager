//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let tellerNumber: Int
    
    init(number: Int) {
        self.tellerNumber = number
    }
    
    func printStartTask(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    func printFinishTask(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}
