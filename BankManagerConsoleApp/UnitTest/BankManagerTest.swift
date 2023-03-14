//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTest: XCTestCase {
    var dummyBank: DummyBank!
    var sut: BankManager?
    
    override func setUpWithError() throws {
        dummyBank = DummyBank()
        sut = BankManager(bank: dummyBank)
    }

    override func tearDownWithError() throws {
        dummyBank = nil
        sut = nil
    }

    func test_start호출시_Input이_1일때_bank에totalCustomer가전달된다() throws {
        // given
        let input = "1"
        
        // when
        
        // then
        
    }
}
