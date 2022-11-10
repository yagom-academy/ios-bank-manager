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
    mutating func resetData()
}

struct BankManager: BankManagable {
    private var clientCount: Int = 0
    
    func checkCount() -> Int {
        return clientCount
    }
    
    mutating func addClientCount() {
        clientCount += 1
    }
    
    mutating func resetData() {
        clientCount = 0
    }
}
