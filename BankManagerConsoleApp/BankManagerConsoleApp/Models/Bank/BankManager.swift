//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var clientCount: Int = 0
    private var totalWorkTime: Double = 0.0
    private var currentDate: Date = Date()
    
    mutating func addCount() {
        clientCount += 1
    }
    
    mutating func startTimer() {
        currentDate = Date()
    }
    
    mutating func stopTimer() {
        totalWorkTime += -currentDate.timeIntervalSinceNow
    }
    
    func bringClientCount() -> Int {
        return clientCount
    }
    
    func bringTotalWorkTime() -> Double {
        return totalWorkTime
    }
}
