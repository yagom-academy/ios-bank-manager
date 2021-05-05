//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

while true {
    switch Bank.selectMenu() {
    case .start:
        do {
            let bankManger = BankManager(numberOfManager: 3)
            let clients: [Client] =  try Client.create()
            Bank(bankManger, clients).operate()
        } catch let error {
            print("\(error.localizedDescription)")
        }
    case .end:
        exit(0)
    default:
        print("잘못된 입력입니다.")
    }
}
