//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

protocol BankManagable {
    var clientCount: Int { get }
    mutating func addClientCount()
    mutating func resetData()
}

struct BankManager: BankManagable {
    private(set) var clientCount: Int = .zero
    
    mutating func addClientCount() {
        clientCount += 1
    }
    
    mutating func resetData() {
        clientCount = .zero
    }
}
