//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/29.
//

import Foundation

final class Bank {
    private var clients: [Client]
    private var tellers: BankManager = BankManager(numberOfManager: 1)
    private var totalTaskTime: Double = 0
    
    init(_ clients: [Client]) {
        self.clients = clients
    }
    
    private func selectMenu() -> MenuSelection? {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
        
        guard let menuNumber = readLine() else { return nil }
        
        if menuNumber == "1" {
            return .start
        } else if menuNumber == "2" {
            return .end
        } else {
            return nil
        }
    }
    
    private func open() {
        totalTaskTime = tellers.handleTask(clients)
    }
    
    private func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clients.count)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초입니다.")
        
        clients.removeAll()
    }
    
    func operate() {
        while true {
            switch selectMenu() {
            case .start:
                open()
                close()
            case .end:
                return
            default:
                print("잘못된 입력입니다.")
                continue
            }
        }
    }
}
