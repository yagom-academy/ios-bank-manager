//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    var isAvailable: Bool = false
    
    func work(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        print("\(customerNumber)번 고객 업무 종료")
    }
}
