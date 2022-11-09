//
//  main.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

typealias ReportData = (customerCount: Int, duringTime: TimeInterval)

let bank = Bank()
let bankManager = BankManager(bank: bank)

var console = ConsoleManager(bankManager: bankManager)
console.startConsole()
