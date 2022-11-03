//
//  BankManagerTests.swift
//  BankManagerConsollAppTests
//
//  Created by jeremy, LJ on 2022/11/03.
//

import XCTest

class BankManagerTests: XCTestCase {
    var sut: BankManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_toggleAvailability메서드가_true_false_토글하는지 () {
        //when
        sut.toggleAvailability()
        
        //then
        XCTAssertFalse(sut.isAvailable)
    }
}
