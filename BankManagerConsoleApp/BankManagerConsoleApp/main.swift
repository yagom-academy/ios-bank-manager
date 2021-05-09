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
            var clients: [Client] = []
            
            for number in 1...Int.random(in: 10...30) {
                clients.append(try Client.create(number))
            }
            
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
