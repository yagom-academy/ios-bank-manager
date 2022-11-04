//
//  CustomerQueueTests.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import XCTest

final class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CustomerQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_값_100을_Enqueue한후_Dequeue를_한값이_100과_동일한가() {
        // given
        let inputValue = 100
        
        // when
        sut.enqueue(value: inputValue)
        
        // then
        let result = sut.dequeue()
        XCTAssertEqual(result, inputValue)
    }
    
    func test_빈큐의_isEmpty의_값이_true인가() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐에_값_100을_Enqueue한후_isEmpty의_값이_false인가() {
        // given
        let inputValue = 100
        
        // when
        sut.enqueue(value: inputValue)
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
        
    }
    
    func test_값_100_200_300을_Enqueue한후_peek을_한결과와_head의_Data가_동일한가() {
        // given
        let inputValues = [100, 200, 300]
        
        // when
        inputValues.forEach { sut.enqueue(value: $0) }
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, 100)
    }
    
    func test_head가_없는_경우_peek의_결과가_nil과_동일한가() {
        // given
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_clear를_하고나면_모든값이_지워져있는가() {
        // given
        let inputValues = [100, 200, 300]
        
        // when
        inputValues.forEach { sut.enqueue(value: $0) }
        sut.clear()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
