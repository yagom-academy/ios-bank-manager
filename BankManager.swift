//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    var bank = Bank()
}
// MARK: - BankManager extenstion
extension BankManager {
    mutating func selectMenu() {
        print("1 : 은행개점\n2 : 종료\n입력 : ", terminator: "")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            start()
        case "2":
            return
        default:
            return selectMenu()
        }
    }
}
