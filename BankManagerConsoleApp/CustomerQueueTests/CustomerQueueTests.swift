//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by 변재은 on 2022/06/28.
//

import XCTest

class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CustomerQueue<Int>(list: LinkedList<Int>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_queue가_비어있으면_isEmpty가_true반환() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue에_1과2를_enqueue하고_peek을_수행하면_1반환() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue에_3과4를_enqueue하고_dequeue하면_3반환() {
        // given
        sut.enqueue(3)
        sut.enqueue(4)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_queue에_3과4를_enqueue하고_dequeue를_진행한후_peek하면_4반환() {
        // given
        sut.enqueue(3)
        sut.enqueue(4)
        
        // when
        _ = sut.dequeue()
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, 4)
    }
    
    func test_queue에_값들을넣고_clear하면_리스트가_비워지고_isEmpty가_true반환() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        sut.clear()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
