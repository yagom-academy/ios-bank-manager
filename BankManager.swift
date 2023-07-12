//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    mutating func runProgram() {
        var bank: Bank = createBank()
        var isContinue: Bool = true
        
        while isContinue {
            showMenu()
            
            guard let inputValue = readLine(),
                  let inputValue = UInt(inputValue),
                  Menu.allCases.map({ $0.rawValue }).contains(inputValue),
                  let menu = Menu(rawValue: inputValue) else {
                continue
            }
                        
            switch menu {
            case Menu.bankOpening:
                bank.open()
            case Menu.quit:
                isContinue = false
            }
        }
    }
    
    private func createBank() -> Bank {
        return Bank(numberOfCustomer: generateRandomNumber())
    }
    
    private func generateRandomNumber() -> UInt {
        return UInt.random(in: RandomNumberRange.min...RandomNumberRange.max)
    }
    
    private func showMenu() {
        print(Menu.message, terminator: "")
    }
}

extension BankManager {
    private enum Menu: UInt, CaseIterable {
        static let message: String = "1 : 은행 개점\n2 : 종료\n입력 : "
        
        case bankOpening = 1
        case quit = 2
    }
    
    private enum RandomNumberRange {
        static let min: UInt = 10
        static let max: UInt = 30
    }
}
