//
//  BankTellerTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/28.
//

import XCTest
@testable import BankManagerConsoleApp

class BankTellerTest: XCTestCase {
    struct DummyBankTeller: BankTeller {}
    var dummyBankTeller = DummyBankTeller()

    func test_BankTeller_handleBanking() {
        dummyBankTeller.handleBanking(ofCustomerNumber: 8)
    }
}
