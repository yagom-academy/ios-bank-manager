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

    enum Error: String, Swift.Error {
        case wrongNumberInput = "잘못된 숫자입니다. 다시 입력해 주세요."
        case nilInput = "입력된 값이 없습니다. 다시 입력해 주세요."
        case stringInput = "문자열입니다. 다시 입력해 주세요."
    }

    func start() {}

    private func printMenu() {}

    private func selectMenu() throws {}

    private func handleBankManager() {}
}
