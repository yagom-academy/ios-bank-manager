//
//  BankManager.swift
//  Created by Charlotte, Soll.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let workTime: Double
    
    func startWork(_ customerNumber: Int) {
        for index in 1...customerNumber {
            print("\(index)번 고객 업무 시작")
            usleep(700000)
            print("\(index)번 고객 업무 완료")
        }
    }
}
