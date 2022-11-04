//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankWorker: BankWorker = BankWorker()
var bank: Bank = Bank(bankWorker: bankWorker)

func generateClient() {
    let randomNumber = Int.random(in: ClientNumber.min...ClientNumber.max)
    
    for number in 1...randomNumber {
        let client = Client(ticketNumber: number)
        bank.addClientQueue(client)
    }
}

while true {
    print("""
        1. 은행개점
        2. 종료
        입력 :
        """, terminator: " ")
    
    guard let selection = readLine(),
          let menu = MenuOption(rawValue: selection) else {
        print("올바른 메뉴 번호를 입력해주세요.")
        continue
    }
    
    switch menu {
    case .open:
        generateClient()
        bank.open()
        bank.close()
    case .exit:
        exit(0)
    }
}
