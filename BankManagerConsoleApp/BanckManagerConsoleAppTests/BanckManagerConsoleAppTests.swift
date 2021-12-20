//
//  BanckManagerConsoleAppTests.swift
//  BanckManagerConsoleAppTests
//
//  Created by 권나영 on 2021/12/20.
//

import XCTest

class BanckManagerConsoleAppTests: XCTestCase {

    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue메서드로_1_2_3을넣었을때_first가_1인지() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        XCTAssertEqual(sut.first, 1)
    }
    
    func test_head가_비어있을때_dequeue를하면_nil을반환하는지() {
        let dequeueElement = sut.removeFirst()
        
        XCTAssertNil(dequeueElement)
    }
    
    func test_1_2_3을넣었을때_dequeue를하면_1을반환하는지() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        let dequeueElement = sut.removeFirst()
        
        XCTAssertEqual(dequeueElement, 1)
    }
    
    func test_removeAll로_요소를모두지우면_isEmpty가_true인지() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.isEmpty)
    }

}
