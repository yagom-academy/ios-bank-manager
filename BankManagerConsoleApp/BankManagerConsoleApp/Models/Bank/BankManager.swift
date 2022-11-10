//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

protocol BankManagable {
    func checkCount() -> Int
    mutating func addClientCount()
    mutating func resetWorkTime()
    mutating func addWorkTime()
    mutating func printWorkFinished()
    mutating func resetData()
}

struct BankManager: BankManagable {
    private var clientCount: Int = 0
    private var totalWorkTime: Double = 0.0
    private var workStartTime: Date = Date()
    
    func checkCount() -> Int {
        return clientCount
    }
    
    mutating func addClientCount() {
        clientCount += 1
    }
    
    mutating func resetWorkTime() {
        workStartTime = Date()
    }
    
    mutating func addWorkTime() {
        totalWorkTime -= workStartTime.timeIntervalSinceNow
    }
    
    mutating func printWorkFinished() {
        print("업무가 마감되었습니다. ", terminator: "")
        print("오늘 업무를 처리한 고객은 총 \(clientCount)명이며, ", terminator: "")
        print("총 업무시간은 \(String(format: "%.2f", totalWorkTime))초입니다.")
        resetData()
    }
    
    mutating func resetData() {
        clientCount = 0
        totalWorkTime = 0.0
    }
}
