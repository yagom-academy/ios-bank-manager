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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
