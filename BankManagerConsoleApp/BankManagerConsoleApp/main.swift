//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let mint = Teller()
let shinHanBank = Bank(name: "신한은행", tellers: [mint])

var programManager = ProgramManager(program: shinHanBank)
programManager.selectMenu()
