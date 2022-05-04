//
//  BankManagerConsoleApp - main.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

let someBank = Bank()
var m = BankManager(of: someBank)
m.hireClerks(loanClerk: 1, depositClerk: 2)
m.taskStart()
