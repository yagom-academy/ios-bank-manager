//
//  QueueTests.swift
//  QueueTests
//
//  Created by junho lee on 2022/11/01.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTests: XCTestCase {
    var sut: Queue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_3을_enqueue하고_peek하면_3을반환하는지() {
        // given
        let input: Int = 3
        
        // when
        sut.enqueue(input)
        let result: Int = sut.peek() as! Int
        
        // then
        XCTAssertEqual(result, input)
    }
    
    func test_ABC를_enqueue하고_dequeue하면_enqueue한순서대로_반환하는지() {
        // given
        let input: [String] = ["A", "B", "C"]
        
        // when
        input.forEach { sut.enqueue($0) }
        var result: [String] = []
        for _ in 0..<input.count {
            result.append(sut.dequeue() as! String)
        }
        
        // then
        XCTAssertEqual(result, input)
    }
    
    func test_빈queue에서_dequeue하면_nil을반환하는지() {
        // when
        let result: Any? = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_enqueue한뒤_clear하면_isEmpty가_true인지() {
        // given
        let input: Int = 3
        
        // when
        sut.enqueue(input)
        sut.clear()
        let result: Bool = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
