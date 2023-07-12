//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by idinaloq, EtialMoon on 2023/07/10.
//

import XCTest

final class BankManagerConsoleAppTests: XCTestCase {
    var sut: SingleLinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SingleLinkedList()
    }
    
    func test_초기head가nil일때_isEmpty는true이다() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_리스트에Node가없는경우_enqueue하면_tail을head로설정한다() {
        let data: Int = 123
        
        sut.enqueue(data)
        let head = sut.currentHead()
        let tail = sut.currentTail()
        
        XCTAssert(head === tail)
    }
    
    func test_리스트에Node가있는경우_enqueue하면_head는유지되고tail이추가된다() {
        let firstInput: Int = 123
        let secondInput: Int = 456
        
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        let head = sut.currentHead()
        let tail = sut.currentTail()
        
        XCTAssert(head !== tail)
    }
    
    func test_head에데이터가없는경우_peek에nil이저장된다() {
        let peek = sut.peek
        
        XCTAssertNil(peek)
    }
    
    func test_head에데이터가있는경우_head의데이터가_peek에저장된다() {
        let data: Int = 123
        sut.enqueue(data)
        
        let head = sut.currentHead()
        let peek = sut.peek
        
        XCTAssertEqual(head?.data, peek)
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
    
    func test_임의의값을enqueue한다음_dequeue를하면_enqueue를한값이외의값은나오지않는다() {
        let input: Int = 123
        sut.enqueue(input)
        
        let dequeueData = sut.dequeue()
        
        XCTAssertFalse(input != dequeueData)
    }
    
    func test_리스트에Node가하나만있는경우_dequeue하면_head와tail이nil이된다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        sut.dequeue()
        let head = sut.currentHead()
        let tail = sut.currentTail()
        
        XCTAssertNil(head)
        XCTAssertNil(tail)
    }
    
    func test_리스트에Node가여러개있는경우_dequeue하면_tail은그대로고head가바뀐다() {
        let firstInput: Int = 123
        let secondInput: Int = 456
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        let previousHead = sut.currentHead()
        let previousTail = sut.currentTail()
        
        sut.dequeue()
        let currentHead = sut.currentHead()
        let currentTail = sut.currentTail()
        
        XCTAssert(previousTail === currentTail)
        XCTAssert(previousHead !== currentHead)
    }
    
    func test_리스트에Node가있을때_clear를하면_head와tail이nil이된다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        sut.clear()
        let head = sut.currentHead()
        let tail = sut.currentTail()
        
        XCTAssertNil(head)
        XCTAssertNil(tail)
    }
}
