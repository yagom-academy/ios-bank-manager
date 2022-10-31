//
//  ClientQueueTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

import XCTest
@testable import BankManagerConsoleApp

class ClientQueueTests: XCTestCase {
    var sut: ClientQueue<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = ClientQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_LinkedList에1을append했을때_bringHead메서드의반환값이1이나오는지() {
        sut?.enqueue(1)
        
        XCTAssertEqual(sut?.peek, 1)
    }

    func test_append를한후_peek값이첫번째랑같은지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.enqueue(number)
        }
        
        XCTAssertEqual(sut?.peek, numbers.first)
    }
    
    func test_모든Element들을clear할때_isEmpty가true인지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.enqueue(number)
        }
        
        sut?.clear()
        
        XCTAssertEqual(sut?.isEmpty, true)
    }
    
    func test_dequeue한번호출할때_isEmpty가false인지_dequeue값이첫번째값인지() {
        let numbers = [1, 2, 3]
        
        numbers.forEach { number in
            sut?.enqueue(number)
        }
        
        let result = sut?.dequeue()
        
        XCTAssertEqual(sut?.isEmpty, false)
        XCTAssertEqual(result, numbers.first)
    }
    
    func test_List가비어있을때_dequeue메서드의반환값이nil인지() {
        XCTAssertNil(sut?.dequeue())
    }
}
