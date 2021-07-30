//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 잼킹 on 2021/07/30.
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedListTests: XCTestCase {
    var linkedListSut: LinkedList<Int>!
    
    override func setUp() {
        linkedListSut = LinkedList()
    }

    func test_addLast했을때_리스트는_비어있지않다() {
        //given
        let one = 1
        //when
        linkedListSut.addLast(data: one)
        let expectResult = linkedListSut.isEmpty
        //then
        XCTAssertFalse(expectResult)
    }
    
    func test_리스트에_1_2_3을_넣었을때_첫번째값은_1이다() {
        //given
        let one = 1
        let two = 2
        let three = 3
        //when
        linkedListSut.addLast(data: one)
        linkedListSut.addLast(data: two)
        linkedListSut.addLast(data: three)
        let expectResult = linkedListSut.first
        //then
        XCTAssertEqual(expectResult, one)
    }
    
    func test_리스트에_1_2_3을_넣은후_removeAll을하면_값이비어있다() {
        //given
        let one = 1
        let two = 2
        let three = 3
        linkedListSut.addLast(data: one)
        linkedListSut.addLast(data: two)
        linkedListSut.addLast(data: three)
        //when
        linkedListSut.removeAll()
        let expectResult = linkedListSut.isEmpty
        //then
        XCTAssertTrue(expectResult)
    }
    
    func test_리스트에_1_2_3을_넣은후_removeFirst를_세번하면_값이비어있다() {
        //given
        let one = 1
        let two = 2
        let three = 3
        linkedListSut.addLast(data: one)
        linkedListSut.addLast(data: two)
        linkedListSut.addLast(data: three)
        //when
        linkedListSut.removeFirst()
        linkedListSut.removeFirst()
        linkedListSut.removeFirst()
        let expectResult = linkedListSut.isEmpty
        //then
        XCTAssertTrue(expectResult)
    }
}
