//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

struct BankManager {
    private var clientCount: Int = 0
    private var totalWorkTime: Double = 0.0
    private var currentDate: Date = Date()
    
    mutating func addClientCount() {
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
    
    mutating func resetData() {
        clientCount = 0
        totalWorkTime = 0.0
    }
}
