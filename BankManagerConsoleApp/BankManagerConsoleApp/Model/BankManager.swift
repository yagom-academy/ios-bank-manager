//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Dasan & Mary
//

struct BankManager {
    mutating func runProgram() {
        var bank: Bank = createBank()
        var isContinue: Bool = true
        
        while isContinue {
            showMenu()
            
            guard let inputValue = readLine() else {
                continue
            }
                        
            switch inputValue {
            case Menu.bankOpening.number:
                bank.open()
            case Menu.quit.number:
                isContinue = false
            default:
                continue
            }
        }
    }
    
    private func createBank() -> Bank {
        let randomNumber = generateRandomNumber()
        
        return Bank(numberOfCustomer: randomNumber)
    }
    
    private func generateRandomNumber() -> UInt {
        return UInt.random(in: RandomNumberRange.min...RandomNumberRange.max)
    }
    
    private func showMenu() {
        print(Menu.message, terminator: "")
    }
}

extension BankManager {
    private enum Menu {
        static let message: String = "1 : 은행 개점\n2 : 종료\n입력 : "
        
        case bankOpening
        case quit
        
        var number: String {
            switch self {
            case .bankOpening:
                return "1"
            case .quit:
                return "2"
            }
        }
    }
    
    private enum RandomNumberRange {
        static let min: UInt = 10
        static let max: UInt = 30
    }
}
