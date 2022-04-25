//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Eddy, dudu on 2022/04/25.
//

import XCTest

class LinkedListTest: XCTestCase {
    
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_처음생성했을때_LinkedList가_isEmpty여야한다() {
        XCTAssertTrue(sut.isEmpty)
    }

    func test_LinkedList에_값들을_append했을때_가장처음값이_peek의_값과_같아야한다() {
        //given
        sut.append(10)
        sut.append(20)
        
        //when
        let data = sut.peek
        
        //then
        XCTAssertEqual(data, 10)
    }
    
    func test_LinkedList에_append를했을때_isEmpty가_false여야한다() {
        //when
        sut.append(10)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }

    func test_LinkedList에_값들을_append하고_removeFirst를_했을때_처음_append한값과_같아야한다() {
        //given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        //when
        let data = sut.removeFirst()
        
        //then
        XCTAssertEqual(data, 10)
    }

    func test_LinkedList에_값들을_append하고_clear했을때_isEmpty가_true여야한다() {
        //given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        //when
        sut.clear()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
