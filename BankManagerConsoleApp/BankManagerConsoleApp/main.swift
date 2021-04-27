//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
struct SomeBank: Bank {
    var ticketNumber: Int = 0
}
struct SomeBankTeller: BankTeller {}
struct SomeLooper: Looper {}
struct SomeConsoleViewer: ConsoleViewer {}

var bankManager = BankManager(bank: SomeBank(),
                              bankTeller: SomeBankTeller(),
                              looper: SomeLooper(),
                              consoleViewer: SomeConsoleViewer())
bankManager.openBank()
