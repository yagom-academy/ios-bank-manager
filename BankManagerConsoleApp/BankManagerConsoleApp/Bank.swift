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
    private lazy var bankClients = generateNewClients()
    private var totalWorkTime: Double = 0
    private let generateNewClients = { () -> Queue<BankClient> in
        let newClients = Queue<BankClient>()
        let totalNumberOfClients = Int.random(in: 10...30)
        for waittingNumber in 1...totalNumberOfClients {
            let client = BankClient(waittingNumber: waittingNumber)
            newClients.enqueue(client)
        }
        return newClients
    }
    
    private func resetBank() {
        totalWorkTime = 0
        bankClients.clear()
        bankClients = generateNewClients()
    }
    
    private func printMenu() {
        print("1: 은행개점")
        print("2: 종료")
    }
    
    private func generateInputUserMenuNumber() -> UserInput? {
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
            return generateInputUserMenuNumber()
        }
    }
}
