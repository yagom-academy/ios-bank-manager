//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankManager = BankManager()

while true {
    let bankStatus = bankManager.choiceMenuWithGuide()
    
    if bankManager.controlBankOperation(by: bankStatus) {
        continue
    } else {
        break
    }
}
