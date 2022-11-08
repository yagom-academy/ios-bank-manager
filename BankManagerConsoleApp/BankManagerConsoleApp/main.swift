//
//  main.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

typealias ReportData = (customerCount: Int, duringTime: TimeInterval)

var console = ConsoleManager(bankManager: BankManager(bank: Bank()))
console.startConsole()
