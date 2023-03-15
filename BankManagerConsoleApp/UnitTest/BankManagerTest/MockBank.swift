//
//  MockBank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest
@testable import BankManagerConsoleApp

class MockBank: Openable {
    var open_totalCustomer: Int = 0
    
    func open(totalCustomer: Int) {
        self.open_totalCustomer = totalCustomer
    }
    
    func test(expectedResult: Int) {
        XCTAssertEqual(expectedResult, open_totalCustomer)
    }
}
