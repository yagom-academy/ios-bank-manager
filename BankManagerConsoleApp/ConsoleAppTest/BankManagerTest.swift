//
//  BankManagerTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/28.
//

import XCTest

class BankManagerTest: XCTestCase {
    struct SomeBank: Bank {
        var ticketNumber: Int = 0
    }
    struct SomeBankTeller: BankTeller {}
    struct SomeLooper: Looper {}
    struct SomeConsoleViewer: ConsoleViewer {}

    var dummyBankManager = BankManager(bank: SomeBank(),
                                  bankTeller: SomeBankTeller(),
                                  looper: SomeLooper(),
                                  consoleViewer: SomeConsoleViewer())
    func test_openBank() {
        dummyBankManager.openBank()
    }
    
}
