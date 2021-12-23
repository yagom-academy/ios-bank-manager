//
//  BanckManagerConsoleAppTests.swift
//  BanckManagerConsoleAppTests
//
//  Created by 권나영 on 2021/12/20.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    func test_append메서드로_1_2_3을넣었을때_first가_1인지() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        XCTAssertEqual(sut.first, 1)
    }
    
    func test_head가_비어있을때_removeFirst를하면_nil을반환하는지() {
        let dequeueElement = sut.removeFirst()
        
        XCTAssertNil(dequeueElement)
    }
    
    func test_1_2_3을넣었을때_removeFirst를하면_1을반환하는지() {
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
