//
//  ConsoleController.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/05/04.
//

import Foundation

struct ConsoleController {
    private var userInput: UserInput?
    private var randomCustomerNumber: Int {
        return Int.random(in: Constants.ConsoleController.customerNumberRange)
    }

    enum UserInput: Int {
        case openBank = 1
        case quit = 2
    }

    enum InputError: Swift.Error, CustomStringConvertible {
        case wrong
        case empty

        var description: String {
            switch self {
            case .wrong:
                return "잘못된 입력입니다. 다시 입력해 주세요."
            case .empty:
                return "입력된 값이 없습니다. 다시 입력해 주세요."
            }
        }
    }

    mutating func start(with bankController: BankController) {
        while userInput != .quit {
            print(Constants.ConsoleController.menuScript)
            do {
                try classifyUserInput()
            } catch {
                print(error)
                continue
            }
            handleBankManager(by: bankController)
        }
    }

    private mutating func classifyUserInput() throws {
        guard let userInputString = readLine() else { throw InputError.empty }
        guard let userInputNumber = Int(userInputString) else { throw InputError.wrong }

        switch userInputNumber {
        case UserInput.openBank.rawValue:
            userInput = UserInput.openBank
        case UserInput.quit.rawValue:
            userInput = UserInput.quit
        default:
            throw InputError.wrong
        }
    }

    private func handleBankManager(by bankController: BankController) {
        if userInput == .openBank {
            bankController.openBank(customerNumber: randomCustomerNumber)
            bankController.closeBank()
        }
    }
}
