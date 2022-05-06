//
//  BankManagerConsoleApp - main.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

let someBank = Bank(loanClerksCount: 1, depositClerksCount: 2)
var m = BankManager(of: someBank)
m.taskStart()
