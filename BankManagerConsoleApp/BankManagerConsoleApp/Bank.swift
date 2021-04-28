//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct MenuPrinter {
    enum MenuPhrase {
        static let bankOpen = "1 : 은행개점"
        static let exit = "2 : 종료"
        static let input = "입력 : "
    }
    
    static func printMenu() {
        print(MenuPhrase.bankOpen)
        print(MenuPhrase.exit)
        print(MenuPhrase.input, terminator:"")
    }
}

struct Inputer {
    enum StringConstant {
        static let blank = ""
    }
    
    static func receive() -> String {
        guard let input = readLine() else {
            return StringConstant.blank
        }
        return input
    }
}

class Bank {
    private var bankManager: BankManager
    
    init() {
        bankManager = BankManager(numberOfBanker: 1)
    }
    
    private func startWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankManager.inputCustomersToWaitingLine()
        let endTime = CFAbsoluteTimeGetCurrent()
        print(endTime - startTime)
    }
    
    func open() {
        while (true) {
            MenuPrinter.printMenu()
            let input = Inputer.receive()
            switch input {
            case "1":
                startWork()
            case "2":
                return
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
}
