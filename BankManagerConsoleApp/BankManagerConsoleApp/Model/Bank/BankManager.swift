//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    private enum Constant {
        static let menu = "1 : 은행개점\n2 : 종료\n입력 : "
        static let empty = ""
    }
    
    private var bank = Bank()
    private var receivedInput: String {
        return readLine() ?? Constant.empty
    }
    
    mutating func selectMenu() {
        print(Constant.menu, terminator: Constant.empty)
        
        switch receivedInput {
        case "1":
            bank.openBank()
        case "2":
            return
        default:
            return selectMenu()
        }
        return selectMenu()
    }
}
