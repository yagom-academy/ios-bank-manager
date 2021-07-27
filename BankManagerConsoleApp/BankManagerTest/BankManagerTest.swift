//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by kjs on 2021/07/27.
//

@testable import BankManagerConsoleApp
import XCTest

class BankManagerTest: XCTestCase {
    var queue: Queue<Int>!
    
    override func setUp() {
        super.setUp()
        queue = Queue()
    }
    
    override func tearDown() {
        super.tearDown()
        queue = nil
    }
    
    func test_queue에_3을enqueue하면_3이들어간다() {
        let expectedResult = 3
        queue.enqueue(value: 3)
        
        let enqueuedResult = queue.peek()
        
        XCTAssertEqual(enqueuedResult, expectedResult)
    }
    
    func test_3만들어간queue에서_dequeue를하면_queue는비어있다() {
        queue.enqueue(value: 3)
        
        queue.dequeue()
        
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    func test_3이들어간queue에서_dequeue를하면_그값은3이다() {
        queue.enqueue(value: 3)
        
        let value = queue.dequeue()
        
        XCTAssertEqual(value, 3)
    }
    
    func test_3이들어간queue에서_peek를하면_그값은3이다() {
        queue.enqueue(value: 3)
        
        let value = queue.peek()
        
        XCTAssertEqual(value, 3)
    }
    
    func test_숫자들이들어간queue에서_clear를하면_queue는비어있다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        
        queue.clear()
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_숫자들이들어간queue에서_isEmpty는false다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        
        XCTAssertFalse(queue.isEmpty)
    }
}
