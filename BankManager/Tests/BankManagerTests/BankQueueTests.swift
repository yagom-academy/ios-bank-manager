//
//  BankQueueTests.swift
//  
//
//  Created by Jaehun Lee on 3/19/24.
//

import XCTest
@testable import BankManager

final class BankQueueTests: XCTestCase {
    var sut: BankQueue<Int>!
    
    override func setUp() {
        super.setUp()
        sut = BankQueue()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_비어있는_큐에_3을_enqueue() {
        // Given
        let expectedLast = 3
        let expectedCount = 1
        
        // When
        sut.enqueue(element: 3)
        
        // Then
        XCTAssertEqual(expectedLast, sut.last)
        XCTAssertEqual(expectedCount, sut.count)
    }
    
    func test_원소의_개수가_1인_큐에서_dequeue_후_4를_enqueue() {
        // Given
        test_비어있는_큐에_3을_enqueue()
        let expectedLast = 4
        let expectedCount = 1
        
        // When
        let _ = sut.dequeue()
        sut.enqueue(element: 4)
        
        // Then
        XCTAssertEqual(expectedLast, sut.last)
        XCTAssertEqual(expectedCount, sut.count)
    }
    
    func test_비어있지_않은_큐에_5를_enqueue() {
        // Given
        test_비어있는_큐에_3을_enqueue()
        let expectedLast = 5
        let expectedCount = 2
        
        // When
        sut.enqueue(element: 5)
        
        // Then
        XCTAssertEqual(expectedLast, sut.last)
        XCTAssertEqual(expectedCount, sut.count)
    }
    
    func test_비어있는_큐에_dequeue() {
        // When
        let result = sut.dequeue()
        
        // Then
        XCTAssertNil(result)
    }
    
    func test_비어있지_않은_큐에_dequeue() {
        // Given
        test_비어있는_큐에_3을_enqueue()
        let expectedResult = 3
        
        // When
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_큐에_clear() {
        // Given
        test_비어있지_않은_큐에_5를_enqueue()
        let expectedCount = 0
        
        // When
        sut.clear()
        
        // Then
        XCTAssertNil(sut.first)
        XCTAssertNil(sut.last)
        XCTAssertEqual(expectedCount, sut.count)
    }
}
