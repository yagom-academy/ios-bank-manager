//
//  LinkedListTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_LinkedList에1을append했을때_bringHead메서드의반환값이1이나오는지() {
        sut?.append(data: 1)
        
        XCTAssertEqual(sut?.headData, 1)
    }
    
    func test_LinkedList에append를3번진행하였을때_count값이3인지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.append(data: number)
        }
        
        XCTAssertEqual(sut?.currentCount, numbers.count)
    }
    
    func test_bringHead메서드의반환값이첫번째로append된값이나오는지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.append(data: number)
        }
        
        XCTAssertEqual(sut?.headData, numbers.first)
    }
    
    func test_removeFirst메서드를호출했을때_첫번째값이삭제되고반환값으로삭제된값이나오는지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.append(data: number)
        }
        
        let result = sut?.removeFirst()
        
        XCTAssertEqual(sut?.currentCount, numbers.count - 1)
        XCTAssertEqual(result, numbers.first)
    }
    
    func test_removeAll메서드가정상작동하는지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.append(data: number)
        }
        
        sut?.removeAll()
        
        XCTAssertNil(sut?.headData)
        XCTAssertEqual(sut?.currentCount, 0)
    }
}
