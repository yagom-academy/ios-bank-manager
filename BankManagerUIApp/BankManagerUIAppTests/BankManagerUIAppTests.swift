//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    var sut: LinkedListQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedListQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를_호출하여_1과2와3을_넣고_노드개수가_3개면_True를_반환하는지() {
        // given
        let expectation = 3
        
        // when
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
}
