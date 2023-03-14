//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTest: XCTestCase {
    var dummyBank: MockBank!
    var sut: BankManager!
    var dummyCustomerReceiver: StubCustomerReceiver!
    
    override func setUpWithError() throws {
        dummyBank = MockBank()
        dummyCustomerReceiver = StubCustomerReceiver()
        sut = BankManager(bank: dummyBank, customerReceiver: dummyCustomerReceiver)
    }

    override func tearDownWithError() throws {
        dummyBank = nil
        dummyCustomerReceiver = nil
        sut = nil
    }

    func test_start호출시_userInput이_1일때_bank에totalCustomer가전달된다() throws {
        // given
        let testValue = 30
        dummyCustomerReceiver.totalCustomer = testValue
        let expectation = dummyCustomerReceiver.totalCustomer
        
        // when
        sut.start()
        
        // then
        dummyBank.test(expectedResult: expectation)
        
    }
}
