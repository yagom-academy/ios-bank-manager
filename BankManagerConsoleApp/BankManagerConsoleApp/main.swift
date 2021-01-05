//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

private var bankManager = BankManager()
bankManager.showMenu()

private var selectedMenu = Int(readLine() ?? "")

while selectedMenu == 1 {
    bankManager = BankManager()
    bankManager.openBank()
    bankManager.showMenu()
    selectedMenu = Int(readLine() ?? "")
}

bankManager.closeBank()
