//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

while true {
    switch Bank.selectMenu() {
    case .start:
        let clients: [Client] = Client.create()
        Bank(clients).operate()
    case .end:
        exit(0)
    default:
        print("잘못된 입력입니다.")
    }
}
