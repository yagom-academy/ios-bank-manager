//
//  BankTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/04.
//

import XCTest

class BankTest: XCTestCase {
    var sut: Bank!
    
    override func setUpWithError() throws {
        sut = Bank(numberOfBankTeller: 1)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_openBank_호출시_openTime이_초기화되는지() {
        XCTAssertTrue(sut.openTime == nil)
        sut.openBank()
        XCTAssertTrue(sut.openTime != nil)
    }
    
    func test_closeBank_호출시_closeTime이_초기화되는지() {
        sut.openBank()
        do {
            try sut.closeBank(totalCustomerNumber: 1)
        } catch {
            XCTFail("closeTime is nil")
        }
    }
}
