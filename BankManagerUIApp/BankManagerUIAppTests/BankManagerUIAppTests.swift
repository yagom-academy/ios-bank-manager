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
        sut.enqueue(data: 11)
        sut.enqueue(data: 12)
        
        // when
        sut.dequeue()
        sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_dequeue함수호출을하면_처음들어온값을_삭제하는지_확인하는함수() {
        // given
        let input: Double = 12
        sut.enqueue(data: 11)
        sut.enqueue(data: 12)
        
        // when
        sut.dequeue()
        
        // then
        XCTAssertEqual(input, sut.head?.data)
    }
    
    func test_clearAll함수를호출할경우_모든값이삭제되는지_확인하는함수() {
        // given
        sut.enqueue(data: 11)
        sut.enqueue(data: 13)
        sut.enqueue(data: 15)
        sut.enqueue(data: 17)
        
        // when
        sut.clearAll()
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_peek함수호출시_현재List의첫번째값을_반환하는지_확인하는함수() {
        // given
        let input: Double = 13
        sut.enqueue(data: 11)
        sut.enqueue(data: 13)
        sut.dequeue()
        sut.enqueue(data: 15)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(input, result)
    }

}
