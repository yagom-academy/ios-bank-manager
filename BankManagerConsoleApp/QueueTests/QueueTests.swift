//
//  QueueTests.swift
//  QueueTests
//
//  Created by Ayaan on 2022/10/31.
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
    
    func test_빈_Queue를_peek한_경우_결과값은_nil이다() {
        //given
        
        //when
        let result: Int? = sut.peek()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_10을_enqueue한_후_peek한_경우_결과값은_10과_같다() {
        //given
        sut.enqueue(10)
        
        //when
        let result: Int? = sut.peek()
        
        //then
        XCTAssertEqual(result, 10)
    }
    
    func test_빈_Queue를_dequeue한_경우_결과값은_nil이다() {
        //given
        
        //when
        let result: Int? = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_20을_enqueue하고_dequeue한_경우_결과값은_20과_같다() {
        //given
        sut.enqueue(20)
        
        //when
        let result: Int? = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 20)
    }
    
    func test_10_20_30을_순서대로_enqueue하고_dequeue한_경우_결과값은_10과_같다() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)
        
        //when
        let result: Int? = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 10)
    }
    
    func test_10_20_30을_순서대로_enqueue하고_3번_dequeue한_경우_결과값은_30과_같다() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)
        
        //when
        var result: Int? = sut.dequeue()
        result = sut.dequeue()
        result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 30)
    }
    
    func test_10_20_30을_순서대로_enqueue하고_clear한_경우_peek의_값은_nil이다() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)
        
        //when
        sut.clear()
        
        //then
        XCTAssertNil(sut.peek())
    }
}
