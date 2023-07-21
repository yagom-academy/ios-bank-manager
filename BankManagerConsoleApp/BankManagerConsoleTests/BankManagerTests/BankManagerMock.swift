//
//  BankManagerMock.swift
//  BankManagerTests
//
//  Created by Dasan & Mary on 2023/07/22.
//

@testable import BankManagerConsoleApp

struct BankManagerMock {
    var bank: Openable

    init(bank: Openable) {
        self.bank = bank
    }
        
    mutating func runProgram(enterable: Enterable) {
        var shouldContinue = true
        
        while shouldContinue {
            showMenu()
            
            guard let inputValue = enterable.enterUserInput() else {
                return
            }
                        
            switch inputValue {
            case Menu.bankOpening.number:
                bank.open(numberOfCustomer: generateRandomNumber())
                shouldContinue = false
            case Menu.quit.number:
                shouldContinue = false
            default:
                shouldContinue = false
            }
        }
    }
    
    private func generateRandomNumber() -> Int {
        return Int.random(in: RandomNumberRange.min...RandomNumberRange.max)
    }
    
    private func showMenu() {
        print(Menu.message, terminator: "")
    }
}

extension BankManagerMock {
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
        static let min: Int = 10
        static let max: Int = 30
    }
}
