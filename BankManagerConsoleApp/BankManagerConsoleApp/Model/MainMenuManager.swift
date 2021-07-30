//
//  ConsoleMessages.swift
//  BankManagerConsoleApp
//
//  Created by Ellen on 2021/07/30.
//

import Foundation

enum MainMenuMessage {
    case firstSelection
    case secondSelection
    case userInput
    
    var description: String {
        switch self {
        case .firstSelection:
            return "1 : 은행개점"
        case .secondSelection:
            return "2 : 종료"
        case .userInput:
            return "입력 : "
        }
    }
}

struct MainMenu {
    
    private var userInput: String?
    
    public mutating func startMainMenu() {
        beginToReceiveUserInput()
    }
    
    private func displayMainMenuMessage() {
        print(MainMenuMessage.firstSelection.description)
        print(MainMenuMessage.secondSelection.description)
        print(MainMenuMessage.userInput.description, terminator: "")
    }
    
    private mutating func beginToReceiveUserInput() {
        let wrongUserInput: Bool = self.userInput != Optional("1")
                                && self.userInput != Optional("2")
        repeat {
            displayMainMenuMessage()
            getUserInput()
        } while wrongUserInput == false
    }
    
    private mutating func getUserInput() {
        self.userInput = readLine()
    }
    
    private func unwrapUserInput() -> String {
        guard let userInputResult = self.userInput else { return "" }
        return userInputResult
    }
}
