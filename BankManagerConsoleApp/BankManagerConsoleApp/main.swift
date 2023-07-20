//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let shinHanBank = Bank(name: "신한은행", tellers: [.deposit: 3, .loan: 1])

var programManager = ProgramManager(program: shinHanBank)
programManager.selectMenu()
