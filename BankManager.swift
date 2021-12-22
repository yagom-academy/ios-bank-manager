//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    func runConsoleApp() {
        let menu = """
                   1 : 은행 개점
                   2 : 종료
                   입력 :
                   """
        while true {
            print(menu, terminator: " ")
            let randomNumber = Int.random(in: 10...30)
            switch readLine() {
            case "1":
                Bank(numberOfClients: randomNumber, numberOfBankTellers: 1).startBusiness()
            case "2":
                return
            default:
                continue
            }
        }
    }
}
