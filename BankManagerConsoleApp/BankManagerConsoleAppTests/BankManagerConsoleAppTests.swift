//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by idinaloq, EtialMoon on 2023/07/10.
//

import XCTest

final class BankManagerConsoleAppTests: XCTestCase {
    var sut: LinkedListStub<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedListStub()
    }
    
    func test_head가nil일때_isEmpty는true이다() {
        sut.head = nil
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_head에데이터가없는경우_peek에nil이저장된다() {
        let peek = sut.peek
        
        XCTAssertNil(peek)
    }
    
    func test_head에데이터가있는경우_head의데이터가_peek에저장된다() {
        sut.head = Node(data: 123)
        
        let headData = sut.head?.data
        let peek = sut.peek
        
        XCTAssertEqual(headData, peek)
    }
    
    func test_리스트에Node가없는경우_enqueue하면_tail을head로설정한다() {
        let data: Int = 123
        
        sut.enqueue(data)
        
        XCTAssert(sut.head === sut.tail)
    }
    
    func test_리스트에Node가있는경우_enqueue하면_head는유지되고tail이추가된다() {
        let firstInput: Int = 123
        let secondInput: Int = 456
        
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        
        XCTAssert(sut.head !== sut.tail)
    }
    
    func test_리스트에Node가없는경우_dequeue하면_nil을반환한다() {
        let dequeueData = sut.dequeue()
        
        XCTAssertNil(dequeueData)
    }
    
    func test_리스트에Node가있는경우_dequeue하면_dequeue한값을반환한다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        let dequeueData = sut.dequeue()
        
        XCTAssertEqual(firstInput, dequeueData)
    }
    
    func test_리스트에Node가하나만있는경우_dequeue하면_head와tail이nil이된다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        sut.dequeue()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_리스트에Node가여러개있는경우_dequeue하면_tail은그대로고head가바뀐다() {
        let firstInput: Int = 123
        let secondInput: Int = 456
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        let tail = sut.tail
        let head = sut.head
        
        sut.dequeue()
        
        XCTAssert(tail === sut.tail)
        XCTAssert(head !== sut.head)
    }
    
    func test_리스트에Node가있을때_clear를하면_head와tail이nil이된다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        sut.clear()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
