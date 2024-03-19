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
        let expectedFirst = 3
        let expectedCount = 1
        
        // When
        sut.enqueue(element: 3)
        
        // Then
        XCTAssertEqual(expectedFirst, sut.first)
        XCTAssertEqual(expectedCount, sut.count)
    }
}
