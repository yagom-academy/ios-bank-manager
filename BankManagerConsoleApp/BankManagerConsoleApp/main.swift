//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Dasan & Mary
//

struct EnterableStruct: Enterable { }

let enterable = EnterableStruct()
var bankManager = BankManager(bank: Bank())

bankManager.runProgram(enterable: enterable)
