//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by minsson, Derrick kim on 2022/06/28.
//

import XCTest

class BankManagerTests: XCTestCase {
    var sut: ClientQueue<Int>!
    
    override func setUpWithError() throws {
        try! super.setUpWithError()
        sut = ClientQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        try! super.tearDownWithError()
        sut = nil
    }
    
    func test_대기열의_peek은_첫번째_고객을_조회한다() {
        // given
        let expectation: Int = 1
        for number in 1...3 {
            sut.enqueue(number)
        }
        
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_대기열에_10번_enqueue후_10번_dequeue하면_대기열의_head는_nil이다() {
        // given
        for number in 1...10 {
            sut.enqueue(number)
        }
        
        // when
        for _ in 1...10 {
            let _ = sut.dequeue()
        }
        
        // then
        let result = sut.peek
        XCTAssertNil(result)
    }
    
    func test_대기열을_clear하면_isEmpty는_true를_반환한다() {
        // given
        for number in 1...10 {
            sut.enqueue(number)
        }
        
        // when
        sut.clear()
        
        // then
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
}
