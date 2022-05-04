//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    private enum Constant {
        static let menuList = "1 : 은행개점\n2 : 종료\n입력 : "
        static let wrongSelectMessage = "잘못된 선택입니다."
        static let empty = ""
    }
    
    private var bank = Bank()
    private var receivedInput: String {
        return readLine() ?? Constant.empty
    }
    
    mutating func selectMenu() {
        print(Constant.menuList, terminator: Constant.empty)
        
        switch receivedInput {
        case "1":
            bank.openBank()
        case "2":
            return
        default:
            print(Constant.wrongSelectMessage)
            return selectMenu()
        }
        return selectMenu()
    }
}
