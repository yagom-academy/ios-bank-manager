//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private enum MenuOption: String {
        case startBusiness = "1"
        case exit = "2"
    }
    
    static func runConsoleApp() {
        while true {
            printMenu()
            let userInput = readLine() ?? ""
            let menuOption = MenuOption(rawValue: userInput)
            switch menuOption {
            case .startBusiness:
                let randomNumber = Int.random(in: 10...30)
                Bank(numberOfClients: randomNumber, numberOfBankTellers: 1).startBusiness()
            case .exit:
                return
            case nil:
                continue
            }
        }
    }
    
    private static func printMenu() {
        let menu = """
                   1 : 은행 개점
                   2 : 종료
                   입력 :
                   """
        print(menu, terminator: " ")
    }
}
