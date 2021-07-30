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

class MainManager {
    
    let userInput = UserInputManager()
    let bankManager = BankManager()
    
    public func start() {
        userInput.receiveUserInput()
        if userInput.isChoosefirstSelection == true {

        }
    }
}

class UserInputManager {
    
    private var userInput: String?
    
    public func receiveUserInput() {
        repeatUntilCollectSelection()
    }
    
    private func displayMainMenuMessage() {
        print(MainMenuMessage.firstSelection.description)
        print(MainMenuMessage.secondSelection.description)
        print(MainMenuMessage.userInput.description, terminator: "")
    }
    
    private func getUserInput() {
        self.userInput = readLine()
    }
    
    private func repeatUntilCollectSelection() {
            displayMainMenuMessage()
            getUserInput()
    }
    
    public var isChoosefirstSelection: Bool {
        if self.userInput == Optional("1") {
            return true
        } else {
            return false
        }
    }
}
