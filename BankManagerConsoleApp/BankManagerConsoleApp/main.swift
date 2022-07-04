//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let manager = BankManager()
let queue = CustomerQueue()
var bank = Bank(employee: manager, customer: queue)

do{
    try bank.start()
} catch {
    print("입력이 잘못 되었습니다!")
}
