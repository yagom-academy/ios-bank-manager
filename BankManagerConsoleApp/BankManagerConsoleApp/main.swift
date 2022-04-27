//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

func startProgram() {
    while true {
        printMenu()
        let userInput = receivedUserInput()
        
        switch userInput {
        case "1":
            print("은행 개점")
        case "2":
            return
        default:
            continue
        }
    }
}

fileprivate func printMenu() {
    let menu = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    print(menu, terminator: " ")
}

fileprivate func receivedUserInput() -> String {
    guard let userInput = readLine() else {
        return ""
    }
    
    return userInput
}

startProgram()
