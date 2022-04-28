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
        
        switch input {
        case "1":
            Bank(bankClerkCount: 1).startWork()
            reopen()
        case "2":
            return
        default:
            print("잘못된 입력입니다.")
            reopen()
        }
    }
    
    private func printMenu() {
        print("""
              1 : 은행개점
              2 : 종료
              입력 :
              """, terminator: " ")
    }
    
    private func reopen() {
        open()
    }
}
