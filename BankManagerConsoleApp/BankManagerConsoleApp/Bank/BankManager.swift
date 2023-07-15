//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank = Bank()

    private func displayMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력: ", terminator: "")
    }
    
    mutating func start() {
        while bank.state == .working {
            displayMenu()
            guard let input = readLine(), let rawChoice = UInt(input), let choice = BankMenuChoice(rawValue: rawChoice) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            switch choice {
            case .open:
                bank.open()
            case .quit:
                bank.close()
            }
        }
    }
}

private extension BankManager {
    enum BankMenuChoice: UInt {
        case open = 1
        case quit = 2
    }
}
