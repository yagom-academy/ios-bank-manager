//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class BankManagerConsole {
    
    var bank = Bank()
    
    func run() {
        var menu: Menu?
        repeat {
            printMenu()
            menu = inputMenu()
            operateMenu(input: menu)
        } while menu != .exitProgram
    }
    
    func printMenu() {
        print(MenuMessage.main, terminator: MenuMessage.spaceString)
    }
    
    func inputMenu() -> Menu? {
        guard let input = readLine(),
              let selectedMenu = Menu(number: input) else {
                  return nil
              }
        return selectedMenu
    }
    
    func operateMenu(input menu: Menu?) {
        switch menu {
        case .openBank:
            bank.open()
        case .exitProgram:
            print(MenuMessage.exit)
        default:
            print(MenuMessage.wrongInput)
        }
    }
    
}

extension BankManagerConsole {
    
    enum Menu: String {
        case openBank = "1"
        case exitProgram = "2"
        
        init?(number: String) {
            self.init(rawValue: number)
        }
        
        var menuNumber: String {
            return self.rawValue
        }
        
    }
    
    struct MenuMessage {
        static let main = """
                      1 : 은행 개점
                      2 : 종료
                      입력 :
                      """
        static let exit = "종료되었습니다."
        static let wrongInput = "입력이 잘못되었습니다. 다시 입력해주세요"
        static let spaceString = " "
    }
    
}

let bankManagerConsole = BankManagerConsole()
bankManagerConsole.run()
