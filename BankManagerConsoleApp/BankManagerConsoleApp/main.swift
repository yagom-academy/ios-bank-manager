//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankManager = BankManager()
private var selectedMenu = bankManager.selectMenu()

while selectedMenu == 1 {
    print("은행개점")
    
    
    selectedMenu = bankManager.selectMenu()
}
print("종료")
