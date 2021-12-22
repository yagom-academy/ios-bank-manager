//
//  QueueTests.swift
//  BankManagerTests
//
//  Created by Jae-hoon Sim on 2021/12/20.
//

import XCTest

class QueueTests: XCTestCase {
    
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Queue타입을_초기화하면_peek가_nil인지() {
        // given
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_Queue타입을_초기화하면_isEmpty가_true인지() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_enqueue호출시_가나다를전달했을때_peek가_가나다인지() {
        // given
        let input = "가나다"
        sut.enqueue(input)
        
        // when
        let result = sut.peek()
        let expectation = "가나다"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_가나다가있는Queue에서_dequeue호출시_가나다가_반환되는지() {
        // given
        let input = "가나다"
        sut.enqueue(input)
        
        // when
        let result = sut.dequeue()
        let expectation = "가나다"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_원소3개있는Queue에서_clear호출시_peek가_nil인지() {
        // given
        sut.enqueue("가")
        sut.enqueue("나")
        sut.enqueue("다")
        sut.clear()
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertNil(result)
    }
}
