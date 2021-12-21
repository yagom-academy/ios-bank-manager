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
    
    func test_1부터_4까지의_정수_데이터를_enqueue했을_때_반환값이_1_2_3_4이다() {
        let testData = [1, 2, 3, 4]
        var resultData: [Int] = []
        
        for data in testData {
            sut.enqueue(data)
        }
        
        while !sut.isEmpty {
            guard let dequeuedData = sut.dequeue() as? Int else {
                return
            }
            
            resultData.append(dequeuedData)
        }
        
        XCTAssertEqual(testData, resultData)
    }
    
    func test_a부터_d까지의_문자_데이터를_enqueue를_한_후_clear를_했을_때_WaitingQueue가_비어있다() {
        let testData = ["a", "b", "c", "d"]
        
        for data in testData {
            sut.enqueue(data)
        }
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty)
    }

}
