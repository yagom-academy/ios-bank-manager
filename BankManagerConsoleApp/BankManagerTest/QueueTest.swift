//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by Siwon Kim on 2021/12/21.
//

import XCTest

class QueueTest: XCTestCase {
    var sut: Queue<Int>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가_비어있을때_true를_반환하는지() {
        guard let result = sut?.isEmpty else {
            return
        }
        
        XCTAssertTrue(result)
    }
    
    func test_큐에_1을_enqueue했을때_1이_들어있는지() {
        sut?.enqueue(value: 1)
        let result = sut?.dequeue()
        
        XCTAssertEqual(result, 1)
    }
    
    func test_빈큐에_dequeue했을때_nil이_나오는지() {
        XCTAssertNil(sut?.dequeue())
    }
    
    func test_1과_2가_들어있는_큐를_clear했을때_비어있는지() {
        sut?.enqueue(value: 1)
        sut?.enqueue(value: 2)
        sut?.clear()
        
        guard let result = sut?.isEmpty else {
            return
        }
        
        XCTAssertTrue(result)
    }
    
    func test_1이_들어있는_큐에_peek했을때_값만_반환되고_1이_사라지지않는지() {
        sut?.enqueue(value: 1)
        let result = sut?.peek()
        
        XCTAssertEqual(result, 1)
        
        guard let result = sut?.isEmpty else {
            return
        }
        
        XCTAssertFalse(result)
    }
}
