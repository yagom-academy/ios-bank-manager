//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

fileprivate extension Constants {
    static let bankOpen = "1"
    static let exit = "2"
    static let menu = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    static let whiteSpace = " "
}

func startProgram() {
    // TODO: 매직넘버, 매직스트링 커버, 은행 생성, 에러처리
    let bankClerk = BankClerk(name: "임시")
    let bank = Bank(bankClerk: bankClerk)
    
    while true {
        printMenu()
        let userInput = receivedUserInput()
        
        switch userInput {
        case Constants.bankOpen:
            bank.open()
        case Constants.exit:
            return
        default:
            continue
        }
    }
}

fileprivate func printMenu() {
    let menu = Constants.menu
    print(menu, terminator: Constants.whiteSpace)
}

fileprivate func receivedUserInput() -> String {
    guard let userInput = readLine() else {
        return ""
    }
    
    return userInput
}

startProgram()
