//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    private enum Constant {
        static let menu = "1 : 은행개점\n2 : 종료\n입력 : "
        static let one = "1"
        static let two = "2"
        static let empty = ""
    }
    var bank = Bank()
    var receivedInput: String {
        return readLine() ?? Constant.empty
    }
    
    mutating func selectMenu() {
        print(Constant.menu, terminator: Constant.empty)
        
        switch receivedInput {
        case Constant.one:
            bank.start()
        case Constant.two:
            return
        default:
            return selectMenu()
        }
        return selectMenu()
    }
}
