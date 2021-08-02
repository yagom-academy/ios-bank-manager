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
    
    private mutating func repeatUntilCollectSelection() {
        while userInput != MainMenuMessage.firstSelection.rawValue
                && userInput != MainMenuMessage.secondSelection.rawValue {
            displayMainMenuMessage()
            getUserInput()
            displayIncorrectInput()
        }
    }

    private func displayIncorrectInput() {
        if userInput != MainMenuMessage.firstSelection.rawValue
            && userInput != MainMenuMessage.secondSelection.rawValue {
            print(MainMenuMessage.wrongInput.description)
        }
    }
    
    private mutating func receiveUserInput() {
        repeatUntilCollectSelection()
    }
}
