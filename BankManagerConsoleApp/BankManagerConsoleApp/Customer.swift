//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

struct Customer {
    let waitNumber: Int
    let timeNeedToFinishTask: Double
    
    init(waitNumber: Int, needTime: Double = 0.7) {
        self.waitNumber = waitNumber
        self.timeNeedToFinishTask = needTime
    }
}
