//
//  ConsoleController.swift
//  BankManagerConsoleApp
//
//  Created by duckbok on 2021/05/04.
//

class ConsoleController {
    private var randomCustomerNumber: Int!
    private var userInput: UserInput?
    private let menuScript: String = """
        1 : 은행개점
        2 : 종료
        """

    enum UserInput: Int {
        case openBank = 1
        case quit = 2
    }

    enum Error: Swift.Error, CustomStringConvertible {
        case wrongNumberInput
        case nilInput
        case stringInput

        var description: String {
            switch self {
            case .wrongNumberInput:
                return "잘못된 숫자입니다. 다시 입력해 주세요."
            case .nilInput:
                return "입력된 값이 없습니다. 다시 입력해 주세요."
            case .stringInput:
                return "문자열입니다. 다시 입력해 주세요."
            }
        }
    }

    func start(with bankController: BankController) {}

    private func selectMenu() throws {
        guard let userInputString = readLine() else { throw Error.nilInput }
        guard let userInputNumber = Int(userInputString) else { throw Error.stringInput }

        switch userInputNumber {
        case UserInput.openBank.rawValue:
            userInput = UserInput.openBank
        case UserInput.quit.rawValue:
            userInput = UserInput.quit
        default:
            throw Error.wrongNumberInput
        }
    }

    private func handleBankManager(by bankController: BankController) {
        if userInput == .openBank {
            bankController.openBank(customerNumber: randomCustomerNumber)
            bankController.closeBank()
        }
    }
}
