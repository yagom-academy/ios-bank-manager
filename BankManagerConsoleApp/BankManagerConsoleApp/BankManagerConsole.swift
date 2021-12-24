//
//  BankManagerConsole.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/24.
//

import Foundation

class BankManagerConsole {
    
    private var bank = Bank()
    
    func run() {
        var menu: Menu?
        repeat {
            printMenu()
            menu = inputMenu()
            operateMenu(input: menu)
        } while menu != .exitProgram
    }
    
    private func printMenu() {
        print(MenuMessage.main, terminator: MenuMessage.spaceString)
    }
    
    private func inputMenu() -> Menu? {
        guard let input = readLine(),
              let selectedMenu = Menu(number: input) else {
                  return nil
              }
        return selectedMenu
    }
    
    private func operateMenu(input menu: Menu?) {
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
    
    private enum Menu: String {
        case openBank = "1"
        case exitProgram = "2"
        
        init?(number: String) {
            self.init(rawValue: number)
        }
        
        var menuNumber: String {
            return self.rawValue
        }
        
    }
    
    private struct MenuMessage {
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
