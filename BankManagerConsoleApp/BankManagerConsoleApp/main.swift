//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum BankMenu: String {
    case openBank = "1"
    case exitProgram = "2"
    
    init?(number: String) {
        self.init(rawValue: number)
    }
    
    var menuNumber: String {
        return self.rawValue
    }
    
    static let main = """
                      1 : 은행 개점
                      2 : 종료
                      입력 :
                      """
}

var bank = Bank()

func printMenu() {
    print(BankMenu.main, terminator: " ")
}

func inputMenu() -> BankMenu? {
    guard let input = readLine(),
         let selectedMenu = BankMenu(number: input) else {
             return nil
    }
    return selectedMenu
}

func operateMenu(input menu: BankMenu?) {
    switch menu {
    case .openBank:
        bank.open()
    case .exitProgram:
        print("종료")
    default:
        print("다시 입력")
    }
}

func run() {
    var menu: BankMenu?
    repeat {
        printMenu()
        menu = inputMenu()
        operateMenu(input: menu)
    } while menu != .exitProgram
}

run()
