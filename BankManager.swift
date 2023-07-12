//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private let bank = Bank(bankClerk: BankClerk(), customerCount: Int.random(in: 10...30))
    
    func start() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
        
        selectMenu()
    }
    
    private func selectMenu() {
        guard let userInput = readLine() else { return }
        
        switch userInput {
        case "1":
            bank.opening()
        case "2":
            return
        default:
            print("잘못된 입력입니다.")
        }
        
        start()
    }
}
