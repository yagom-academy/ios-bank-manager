//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
class SomeBank: Bank {
    var numberTicket: Int = 0
}
struct SomeBankTeller: BankTeller {}
struct SomeLooper: Looper {}
struct SomeConsoleViewer: ConsoleViewer {}

let bankManager = BankManager(bank: SomeBank(),
                              bankTeller: SomeBankTeller(),
                              looper: SomeLooper(),
                              consoleViewer: SomeConsoleViewer())
bankManager.openBank()
