//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()

while true {
    let bankStatus = bankManager.choiceMenuWithGuide()
    
    if bankManager.controlBankOperation(by: bankStatus) {
        continue
    } else {
        break
    }
}
