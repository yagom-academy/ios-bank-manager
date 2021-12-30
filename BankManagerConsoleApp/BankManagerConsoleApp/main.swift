//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private let clients = Clients()
private let clerk = BankClerk()
private let bankManager = BankManager(clients: clients, clerk: clerk)
private var menuOperation = MenuOperation(bankManager: bankManager)

menuOperation.runMenu()
