//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    static func run() {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            let choice = readLine()
            
            switch choice {
            case "1":
                var bank = Bank()
                bank.start()
            case "2":
                return
            default:
                break
            }
        }
    }
}
