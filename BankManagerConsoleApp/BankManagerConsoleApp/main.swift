//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: String {
    case start = "1"
    case exit = "2"
}

while true {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    guard let input = readLine(), let menu = Menu(rawValue: input) else {
        print("잘못된 입력입니다.")
        continue
    }
    if menu == .exit {
        break
    }
    let customers = [BankManager.Customer(number: 1, grade: BankManager.Grade.normal, task: BankManager.Task.deposit),
                     BankManager.Customer(number: 2, grade: BankManager.Grade.VIP, task: BankManager.Task.loan),
                     BankManager.Customer(number: 3, grade: BankManager.Grade.VVIP, task: BankManager.Task.loan),
                     BankManager.Customer(number: 4, grade: BankManager.Grade.normal, task: BankManager.Task.deposit),
                     BankManager.Customer(number: 5, grade: BankManager.Grade.VVIP, task: BankManager.Task.loan),
                     BankManager.Customer(number: 6, grade: BankManager.Grade.normal, task: BankManager.Task.deposit),
                     BankManager.Customer(number: 7, grade: BankManager.Grade.VIP, task: BankManager.Task.loan),
    ]
    let bankManager = BankManager(bankerCount: 3, customers: customers)
    bankManager.openBank()
}

