//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankWorker: BankWorker = BankWorker()
var bank: Bank = Bank(bankWorker: bankWorker)

func generateClient() {
    let randomNumber = Int.random(in: 10...30)
    
    for number in 1...randomNumber {
        let client = Client(ticketNumber: number)
        bank.updateClientList(client)
    }
}

while true {
    print("""
        1. 은행개점
        2. 종료
        입력 :
        """, terminator: " ")
    
    let menuNumber: String?  = readLine()
    
    switch menuNumber {
    case "1":
        generateClient()
        bank.open()
        bank.close()
    case "2":
        exit(0)
    default:
        print("올바른 메뉴 번호를 입력해주세요.")
    }
}
