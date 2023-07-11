//
//  BankMangerQueueTests.swift
//  BankMangerQueueTests
//
//  Created by Kobe, Hemg on 2023/07/11.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankMangerQueueTests: XCTestCase {
    
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_5를_추가했을때_첫번째값이5인지() {
        //given
        let input = 5
        //when
        sut.enqueue(input)
        //then
        XCTAssertEqual(input, sut.peek)
    }
    
    func test_3를_추가하고_지웠을때_값이맞는지() {
        //given
        let input = 3
        sut.enqueue(input)
        //when
        let dequeue = sut.dequeue()
        //then
        XCTAssertEqual(input, dequeue)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_3_5_추가하고_3값만_지웠을때_값이flase가나오는지() {
        //given
        let input = 3
        sut.enqueue(input)
        sut.enqueue(5)
        //when
        let dequeue = sut.dequeue()
        //then
        XCTAssertEqual(input, dequeue)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_1_2_3_4_값을추가한후에_Clear를했을때_전부지워지는게맞는지_확인() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        //when
        sut.clear()
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
