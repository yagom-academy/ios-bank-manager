//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        sut = Queue<Int>.init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue_메서드() {
        sut.enqueue(1)
        XCTAssertFalse(sut.isEmpty)
    }
}
