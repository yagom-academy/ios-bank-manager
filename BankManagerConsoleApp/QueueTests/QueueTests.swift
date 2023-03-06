//
//  QueueTests.swift
//  QueueTests
//
//  Created by vetto, kokkilE on 2023/03/06.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTests: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Queue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_비어있는큐에서isEmpty는_true이다() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_비어있지않은큐에서isEmpty는_false이다() {
        // given
        sut.enqueue("test1")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_비어있는큐에서enqueue호출시_head와tail이같다() {
        // given
        sut.enqueue("headIsTail")
        
        // when
        let head = sut.linkedList.head?.data
        let tail = sut.linkedList.tail?.data
        
        // then
        XCTAssertEqual(head, tail)
    }
    
    func test_enqueue여러번호출시_처음enqueue한값이head이다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.enqueue("tail")
        
        // when
        let result = sut.linkedList.head?.data
        let expectation = "head"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue여러번호출시_마지막enqueue한값이tail이다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.enqueue("tail")
        
        // when
        let result = sut.linkedList.tail?.data
        let expectation = "tail"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈큐에서dequeue호출시_nil이반환된다() {
        // given
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_비어있지않은큐에서dequeue호출시_처음enqueue한값이반환된다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.enqueue("tail")
        
        // when
        let result = sut.dequeue()
        let expectation = "head"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_비어있지않은큐에서dequeue호출시_head가head의next로바뀐다() {
        // given
        sut.enqueue("head")
        sut.enqueue("headNext")
        sut.enqueue("tail")
        let _ = sut.dequeue()
        
        // when
        let result = sut.linkedList.head?.data
        let expectation = "headNext"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_비어있지않은큐에서clear호출시_isEmpty는true이다() {
        // given
        sut.enqueue("head")
        sut.enqueue("headNext")
        sut.enqueue("tail")
        sut.clear()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_빈큐에서peek호출시_nil이반환된다() {
        // given
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_비어있지않은큐에서peek호출시_처음enqueue한값이반환된다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.enqueue("tail")
        
        // when
        let result = sut.peek()
        let expectation = "head"
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
