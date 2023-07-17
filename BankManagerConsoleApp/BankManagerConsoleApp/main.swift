//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let shinHanBank = Bank(name: "신한은행", teller: (1,2))

var programManager = ProgramManager(program: shinHanBank)
programManager.selectMenu()
