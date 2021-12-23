//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    static func runConsoleApp() {
        while true {
            Self.printMenu()
            switch readLine() {
            case "1":
                let randomNumber = Int.random(in: 10...30)
                Bank(numberOfClients: randomNumber, numberOfBankTellers: 1).startBusiness()
            case "2":
                return
            default:
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
