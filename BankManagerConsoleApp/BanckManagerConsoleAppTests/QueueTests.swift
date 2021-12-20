//
//  QueueTests.swift
//  BanckManagerConsoleAppTests
//
//  Created by 고은 on 2021/12/20.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue로_1_2_3을넣으면_first가_1을반환하는지() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        
        XCTAssertEqual(sut.first, 1)
    }
    
    func test_비어있을때_dequeue를하면_nil을반환하는지() {
        let dequeueElement = sut.dequeue()
        
        XCTAssertNil(dequeueElement)
    }
    
    func test_1_2_3을넣었을때_dequeue를하면_첫번째요소가_1인지() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        
        let dequeueElement = sut.dequeue()
        
        XCTAssertEqual(dequeueElement, 1)
    }
    
    func test_removeAll로_요소를모두지우면_isEmpty가_true인지() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.isEmpty)
    }
}
