//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum BankMenu: String {
    case openBank = "1"
    case exitProgram = "2"
    
    var menuNumber: String {
        return self.rawValue
    }
    
    static let main = """
                      1 : 은행 개점
                      2 : 종료
                      입력 :
                      """
}

func printMenu() {
    print(BankMenu.main, terminator: " ")
}
