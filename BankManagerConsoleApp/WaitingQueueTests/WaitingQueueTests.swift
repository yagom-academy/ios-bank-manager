//
//  WaitingQueueTests.swift
//  WaitingQueueTests
//
//  Created by Jun Bang on 2021/12/21.
//

import XCTest

class WaitingQueueTests: XCTestCase {
    
    var sut: WaitingQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = WaitingQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1을_넣었을_때_WaitingQueue가_비어있지않다(){
        let testData = 1
        sut.enqueue(testData)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_1을_넣고_dequeue를_했을_때_반환값이_1이다() {
        let testData = 1
        sut.enqueue(testData)

        guard let resultData = sut.dequeue() as? Int else {
            return
        }

        XCTAssertEqual(testData, resultData)
    }

}
