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
        userInput.receiveUserInput()
        if userInput.canStartProgram == true {
            bankManager.bankSimulator()
        }
    }
}

struct UserInputManager {
    private var userInput: String?
    
    var canStartProgram: Bool {
        let firstSelection = Optional("1")
        if self.userInput == firstSelection {
            return true
        } else {
            return false
        }
    }
    
    mutating func receiveUserInput() {
        repeatUntilCollectSelection()
    }
    
    private func displayMainMenuMessage() {
        print(MainMenuMessage.firstSelection.description)
        print(MainMenuMessage.secondSelection.description)
        print(MainMenuMessage.userInput.description, terminator: "")
    }
    
    private mutating func getUserInput() {
        self.userInput = readLine()
    }
    
    private mutating func unwrapUserInput() {
        guard let unwrapUserInput: String = self.userInput else { return }
        userInput = unwrapUserInput
    }
    
    private mutating func repeatUntilCollectSelection() {
        let firstSelection = Optional("1")
        let secondSelection = Optional("2")
        
        while userInput != firstSelection && userInput != secondSelection {
            displayMainMenuMessage()
            getUserInput()
            
            if userInput != firstSelection && userInput != secondSelection {
                print(MainMenuMessage.wrongInput.description)
            }
        }
    }
}
