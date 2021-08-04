//
//  BankManager.swift
//  Created by Charlotte, Soll.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let workTime: Double? = 0
    
    func startWork(_ customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }
}
