//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    var isAvailable: Bool = true
    
    func work(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        print("\(customerNumber)번 고객 업무 종료")
    }
    
    mutating func toggleAvailability() {
        if isAvailable == true {
            isAvailable = false
        } else {
            isAvailable = true
        }
    }
}

