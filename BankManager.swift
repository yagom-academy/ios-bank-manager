//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

fileprivate extension Const {
    static let bankersNumber = 3
    
    static let blank = ""
    static let OpeningInput = "1"
    static let exitInput = "2"
    
    static let startBankSelect = "1 : 은행 개점\n2 : 종료\n입력 : "
    static let wrongInput = "잘못된 입력 입니다."
    static let finishWork = "업무가 마감 되었습니다."
    
}

fileprivate enum UserChoice: Int {
    case start = 1
    case exit = 2
}

protocol Manageable {
    func manageBanker()
    func reportOfDay() -> String
    func recordTime(method: () -> Void)
}

final class BankManager {
    var bank: Manageable = Bank(numberOfBankers: Const.bankersNumber)
    
    func openBank() {
        while workBank() { }
    }
    
    private func workBank() -> Bool {
        print(Const.startBankSelect, terminator: Const.blank)
        guard let userInput = readLine(),
              let chosenNumber = Int(userInput),
              let userChoice = UserChoice(rawValue: chosenNumber) else {
            print(Const.wrongInput)
            return true
        }
        return selectMenu(by: userChoice)
    }
    
    private func selectMenu(by userChoice: UserChoice) -> Bool {
        switch userChoice {
        case .start:
            bank.recordTime {
                bank.manageBanker()
            }
            print(Const.finishWork)
            print(bank.reportOfDay())
            return true
        case .exit:
            return false
        }
    }
}
