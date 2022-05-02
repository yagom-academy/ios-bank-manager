//
//  BankManager.swift
//  Created by yagom.
//  Copyright Donnie, Safari. All rights reserved.
//

import Foundation

struct BankManager {
    
    func open() {
        printMenu()
        guard let input = readLine() else { return }
        guard let userSelect = UserOption(rawValue: input) else {
            selectWrong()
            return
        }
        
        switch userSelect {
        case .bankOpen:
            guard let (customers, totalWorkTime) = Bank(depositClerkCount: 2, loanClerkCount: 1).startWork() else { return }
            finishWork(customers, totalWorkTime)
            reopen()
        case .bankClose:
            return
        }
    }
    
    private func reopen() {
        open()
    }
}

// MARK: - User Select List
private extension BankManager {
    enum UserOption: String {
        case bankOpen = "1"
        case bankClose = "2"
    }
}

// MARK: - Print Method
private extension BankManager {
    func printMenu() {
        print("""
              1 : 은행개점
              2 : 종료
              입력 :
              """, terminator: " ")
    }
 
    func selectWrong() {
        print("잘못된 입력입니다.")
        reopen()
    }
    
    func finishWork(_ customers: Int, _ totalWorkTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(totalWorkTime)초 입니다.")
    }
}
