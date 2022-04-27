//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

func startProgram() {
    // TODO: 매직넘버, 매직스트링 커버, 은행 생성, 에러처리
    let bankClerk = BankClerk(name: "은행원1")
    let bank = Bank(bankClerk: bankClerk)
    
    while true {
        printMenu()
        let userInput = receivedUserInput()
        
        switch userInput {
        case "1":
            bank.open()
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
