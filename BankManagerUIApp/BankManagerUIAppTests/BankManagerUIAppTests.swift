//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    var customQueue: CustomerQueue<String>!
    let input1 = "1"
    let input2 = "2"
    let input3 = "3"
    let input4 = "4"

    override func setUpWithError() throws {
        try super.setUpWithError()
        customQueue = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        customQueue = nil
    }
    
    func test_peek호출시_큐가nil이라면_nil을반환하는지() {
        let peekData = customQueue.peek()
        XCTAssertNil(peekData)
    }
    
    func test_peek호출시_큐가nil이아니라면_데이터를잘반환하는지() {
        customQueue?.enqueue(data: input1)
        customQueue?.enqueue(data: input2)
        customQueue?.enqueue(data: input3)
        let peekData = customQueue.peek()
        XCTAssertEqual(peekData, input1)
    }
    
    func test_enqueue호출시_큐가비어있다면_front의data를잘반환하는지() {
        customQueue?.enqueue(data: input1)
        let peekData = customQueue.peek()
        XCTAssertEqual(peekData, input1)
    }
    
    func test_enqueue호출시_큐가비어있다면_rear의data를잘반환하는지() {
        customQueue?.enqueue(data: input1)
        let peekData = customQueue.peek()
        XCTAssertEqual(peekData, input1)
    }
    
    func test_enqueue여러번호출시_front가정상적인값을나타내는지() {
        customQueue?.enqueue(data: input1)
        customQueue?.enqueue(data: input2)
        customQueue?.enqueue(data: input3)
        let peekData = customQueue.peek()
        XCTAssertEqual(peekData, input1)
    }
    
    func test_dequeue호출시_큐가nil이라면nil이반환되는지() {
        let dequeueData = customQueue.dequeue()
        XCTAssertNil(dequeueData)
    }
    
    func test_dequeue호출시_큐가nil이아니라면_front의노드가잘반환되는지() {
        customQueue?.enqueue(data: input1)
        customQueue?.enqueue(data: input2)
        customQueue?.enqueue(data: input3)
        let dequeueData = customQueue.dequeue()
        XCTAssertEqual(dequeueData, input1)
    }

    func test_isEmpty호출시_큐가비어있을경우_true를반환하는지() {
        XCTAssertTrue(customQueue.isEmpty)
    }
    
    func test_isEmpty호출시_큐가있을경우_false를반환하는지() {
        customQueue?.enqueue(data: input1)
        XCTAssertFalse(customQueue.isEmpty)
    }
    
    func test_clear호출시_큐가비어있는지() {
        customQueue?.enqueue(data: input1)
        customQueue?.enqueue(data: input2)
        customQueue?.enqueue(data: input3)
        customQueue.clear()
        XCTAssertTrue(customQueue.isEmpty)
    }
}
