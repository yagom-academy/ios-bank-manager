//
//  ConsoleMessages.swift
//  BankManagerConsoleApp
//
//  Created by Ellen on 2021/07/30.
//

import Foundation

enum MainMenuMessage: String {
    case firstSelection = "1"
    case secondSelection = "2"
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
    
    func start() {
        if isCanStartProgram == true {
            bankManager.bankSimulator()
        }
    }
    
    private var isCanStartProgram: Bool {
        let returnedUserInput = userInput.returnUserInput()
        
        if returnedUserInput == MainMenuMessage.firstSelection.rawValue {
            return true
        } else {
            return false
        }
    }
}

struct UserInputManager {
    private var userInput: String?
    
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
    
    private var isInCorrectInput: Bool {
        let firstConstraint: Bool = userInput != MainMenuMessage.firstSelection.rawValue
        let secondConstraint: Bool = userInput != MainMenuMessage.secondSelection.rawValue
        let result: Bool = firstConstraint && secondConstraint
        return result
    }
    
    private mutating func repeatUntilCollectSelection() {
        while isInCorrectInput {
            displayMainMenuMessage()
            getUserInput()
            displayIncorrectInput()
        }
    }

    private func displayIncorrectInput() {
        if isInCorrectInput {
            print(MainMenuMessage.wrongInput.description)
        }
    }
    
    private mutating func receiveUserInput() {
        repeatUntilCollectSelection()
    }
}
