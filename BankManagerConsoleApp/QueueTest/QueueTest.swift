//
//  QueueTest.swift
//  QueueTest
//
//  Created by LIMGAUI on 2022/04/26.
//

import XCTest
@testable import Pods_BankManagerConsoleApp

class QueueTest: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - isEmpty호출시
    func test_큐가비어있을때_isEmpty호출시_true를반환하는지() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_큐가비어있지않을때_isEmpty호출시_false를반환하는지() {
        sut.enqueue(newElement: "")
        XCTAssertFalse(sut.isEmpty)
    }
    //MARK: - peek호출시
    func test_enqueue를세번한뒤_peek호출시_처음으로enqueue된값을반환하는지() {
        sut.enqueue(newElement: "1")
        sut.enqueue(newElement: "2")
        sut.enqueue(newElement: "3")
        XCTAssertEqual(sut.peek, "1")
    }
    
    func test_큐가비어있을때_peek호출시_nil을반환하는지() {
        XCTAssertNil(sut.peek)
    }
    //MARK: - dequeue호출시
    func test_두번enqueue후_dequeue호출시_남은요소가두번째로enqueue된것인지() {
        sut.enqueue(newElement: "a")
        sut.enqueue(newElement: "b")
        sut.dequeue()
        XCTAssertEqual(sut.peek, "b")
    }

    func test_enqueue진행후_clear호출시_isEmpty가true를반환하는지() {
        sut.enqueue(newElement: "a")
        sut.enqueue(newElement: "b")
        sut.clear()
        XCTAssertTrue(sut.isEmpty)
    }
}
