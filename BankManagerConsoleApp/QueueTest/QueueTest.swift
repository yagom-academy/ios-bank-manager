//
//  BankQueueTest.swift
//  BankQueueTest
//
//  Created by Jinah Park on 2023/03/06.
//

import XCTest

final class QueueTest: XCTestCase {
    private var sut: Queue<Double>!
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty호출시_값이없을경우_true를반환한다() {
        //given
        sut = .init()
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty호출시_값이있을경우_false를반환한다() {
        //given
        sut = .init()
        sut.enqueue(1.0)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_peek호출시_값이없을경우_nil을반환한다() {
        //given
        sut = .init()
        
        //when
        let result = sut.peek
        
        //then
        XCTAssertNil(result)
    }
    
    func test_peek호출시_값을하나넣으면_하나를반환한다() {
        //given
        sut = .init()
        sut.enqueue(1.0)
        
        //when
        let result = sut.peek
        let expectedData = 1.0
        
        //then
        XCTAssertEqual(result, expectedData)
    }
    
    func test_peek호출시_값을두개넣으면_첫번째값이반환된다() {
        //given
        sut = .init()
        sut.enqueue(2.0)
        sut.enqueue(1.0)
        
        //when
        let result = sut.peek
        let expectedData = 2.0
        
        //then
        XCTAssertEqual(result, expectedData)
    }
    
    func test_enqueue호출시_값을하나넣으면_값이하나들어간다() {
        //given
        sut = .init()
        
        //when
        sut.enqueue(1.0)
        let expectedData = 1.0
        
        //then
        XCTAssertEqual(sut.peek, expectedData)
    }
    
    func test_dequeue호출시_큐가빈상태일경우_nil을반환한다() {
        //given
        sut = .init()
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_dequeue호출시_큐에1과2가있는경우_1을반환하고2가남는다() {
        //given
        sut = .init()
        sut.enqueue(2.0)
        sut.enqueue(1.0)
        
        //when
        let result = sut.dequeue()
        let expectedData = 2.0
        let remainData = sut.peek
        let expectedRemainData = 1.0
        
        //then
        XCTAssertEqual(result, expectedData)
        XCTAssertEqual(remainData, expectedRemainData)
    }
    
    func test_clear호출시_큐에요소가있는경우_모든요소가사라진다() {
        //given
        sut = .init()
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(4.0)
        
        //when
        sut.clear()
        let sutIsEmpty = sut.isEmpty
        
        //then
        XCTAssertTrue(sutIsEmpty)
    }
}
