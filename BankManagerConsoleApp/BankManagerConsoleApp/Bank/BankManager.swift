//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank = Bank()
    private var isWorking: Bool = true
    
    func displayMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력: ", terminator: "")
    }
    
    mutating func selectMenu() {
        while isWorking {
            displayMenu()
            guard let input = readLine(), let choice = Int(input) else { return }
            
            switch choice {
            case 1:
                bank.open()
            case 2:
                isWorking = false
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
}
