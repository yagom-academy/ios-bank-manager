//
//  BankManagerConsolAppTest.swift
//  BankManagerConsolAppTest
//
//  Created by KimJaeYoun on 2021/07/27.
//

import XCTest
@testable import BankManagerConsoleApp

class BankManagerConsolAppTest: XCTestCase {
    let sut = BankManagerQueue<Int>()
    
    func test_queue에_1을추가하면_처음값은1이다() {
        //given
        let number = 1
        //when
        sut.enqueue(data: number)
        let result = sut.peek()!
        //then
        XCTAssertEqual(result, number)
    }
    
    func test_dequeue를_하면_처음들어간값이_삭제된다() {
        //given
        let number1 = 1
        let number2 = 2
        sut.enqueue(data: number1)
        sut.enqueue(data: number2)
        //when
        sut.dequeue()
        let result = sut.peek()!
        //then
        XCTAssertEqual(result, number2)
    }
    
    func test_queue를_전부삭제하면_peek했을시_nil이다() {
        //given
        let number1 = 1
        let number2 = 2
        sut.enqueue(data: number1)
        sut.enqueue(data: number2)
        //when
        sut.clear()
        //then
        XCTAssertNil(sut.peek())
    }
}
