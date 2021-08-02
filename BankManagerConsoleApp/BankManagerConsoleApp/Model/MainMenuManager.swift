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
    case wrongInput
    
    var description: String {
        switch self {
        case .firstSelection:
            return "1 : 은행개점"
        case .secondSelection:
            return "2 : 종료"
        case .userInput:
            return "입력 : "
        case .wrongInput:
            return "잘못된 입력입니다."
        }
    }
}

class MainManager {
    private var userInput = UserInputManager()
    private let bankManager = BankManager()
    
    public func start() {
        if isCanStartProgram == true {
            bankManager.bankSimulator()
        }
    }
    
    private var isCanStartProgram: Bool {
        let returnedUserInput = userInput.returnUserInput()
        let firstSelection = Optional("1")
        
        if returnedUserInput == firstSelection {
            return true
        } else {
            return false
        }
    }
}

struct UserInputManager {
    private var userInput: String?
    private let firstSelection = Optional("1")
    private let secondSelection = Optional("2")
    
    mutating func returnUserInput() -> String? {
        receiveUserInput()
        return userInput
    }
    
    private func displayMainMenuMessage() {
        print(MainMenuMessage.firstSelection.description)
        print(MainMenuMessage.secondSelection.description)
        print(MainMenuMessage.userInput.description, terminator: "")
    }
    
    private mutating func getUserInput() {
        self.userInput = readLine()
    }
    
    private mutating func repeatUntilCollectSelection() {
        while userInput != firstSelection && userInput != secondSelection {
            displayMainMenuMessage()
            getUserInput()
            displayIncorrectInput()
        }
    }
    
    private mutating func receiveUserInput() {
        repeatUntilCollectSelection()
    }
    
    private func displayIncorrectInput() {
        if userInput != firstSelection && userInput != secondSelection {
            print(MainMenuMessage.wrongInput.description)
        }
    }
}
