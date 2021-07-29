//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

protocol Workable {
    var workTime: Double { get }
    func businessProcessing(for client: BankClient)
}

enum UserInput: String {
    case open = "1"
    case close = "2"
}

class Bank {
    let bankClerk = BankClerk()
    let bankClients = Queue<BankClient>()
    private var totalWorkTime: Double = 0
    private var bankWork: UserInput?
    
    func checkInputUserMenuNumber() -> UserInput? {
        print("입력 : ", terminator: "")
        guard let inputNumber = readLine() else {
            return nil
        }
        switch inputNumber {
        case UserInput.open.rawValue:
            return UserInput.open
        case UserInput.close.rawValue:
            return UserInput.close
        default:
            print("잘못된 입력입니다. 다시 입력해주세요.")
            return checkInputUserMenuNumber()
        }
    }
}
