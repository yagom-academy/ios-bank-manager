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
    
    func test_초기firstNode가nil일때_isEmpty는true이다() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_리스트에Node가있는경우_enqueue하면_firstNode는유지된다() {
        let firstInput: Int = 123
        let secondInput: Int = 456

        sut.enqueue(firstInput)
        let previousFirstNode = sut.currentFirstNode()
        sut.enqueue(secondInput)
        let currentFirstNode = sut.currentFirstNode()

        XCTAssert(previousFirstNode === currentFirstNode)
    }
    
    func test_firstNode에데이터가없는경우_peek에nil이저장된다() {
        let peek = sut.peek
        
        XCTAssertNil(peek)
    }
    
    func test_firstNode에데이터가있는경우_firstNode의데이터가_peek에저장된다() {
        let data: Int = 123
        sut.enqueue(data)
        
        let firstNode = sut.currentFirstNode()
        let peek = sut.peek
        
        XCTAssertEqual(firstNode?.data, peek)
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
    
    func test_리스트에Node가하나만있는경우_dequeue하면_firstNode가nil이된다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        sut.dequeue()
        let firstNode = sut.currentFirstNode()
        
        XCTAssertNil(firstNode)
    }
    
    func test_리스트에Node가여러개있는경우_dequeue하면_firstNode가바뀐다() {
        let firstInput: Int = 123
        let secondInput: Int = 456
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        
        let previousFirstNode = sut.currentFirstNode()
        sut.dequeue()
        let currentFirstNode = sut.currentFirstNode()
        
        XCTAssert(previousFirstNode !== currentFirstNode)
    }
    
    func test_리스트에Node가있을때_clear를하면_firstNode가nil이된다() {
        let firstInput: Int = 123
        sut.enqueue(firstInput)
        
        sut.clear()
        let firstNode = sut.currentFirstNode()
        
        XCTAssertNil(firstNode)
    }
}
