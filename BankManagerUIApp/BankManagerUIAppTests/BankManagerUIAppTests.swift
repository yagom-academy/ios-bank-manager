//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    
    var sut: BankQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue함수호출로_값을넣으면_값이삽입되는지확인하는함수() {
        // given
        let input: Double = 11
        
        // when
        sut.enqueue(data: 11)
        
        // then
        XCTAssertEqual(input, sut.head?.data )
    }
    
    func test_head에_값이없을때_isEmpty를호출할경우_true를반환하는지_확인하는함수() {
        // given
        
        // when
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }

}
