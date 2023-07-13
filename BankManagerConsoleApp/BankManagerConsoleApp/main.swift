//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let jusbug = Teller(name: "jusbug")
let mint = Teller(name: "mint")
let seaBank = Bank(name: "신한은행", tellers: [jusbug, mint])

var programManager = ProgramManager(program: seaBank)
programManager.selectMenu()
