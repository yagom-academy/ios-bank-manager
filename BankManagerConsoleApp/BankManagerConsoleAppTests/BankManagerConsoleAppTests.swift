//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by 홍정아 on 2021/07/29.
//

@testable import BankManagerConsoleApp
import XCTest

class BankManagerConsoleAppTests: XCTestCase {
    var sut: Queue<String>!
    
    override func setUp() {
        sut = Queue()
    }
    
    func test_큐를생성하고_혀나블짱짱을enqueue한뒤peek해보면_혀나블짱짱이다() {
        //given
        let expectInputValue = "혀나블 짱짱"
        //when
        sut.enqueue(expectInputValue)
        let expectResult = "혀나블 짱짱"
        let outputValue = sut.peek
        //then
        XCTAssertEqual(expectResult, outputValue)
    }
    
    func test_큐를생성하고_야곰짱짱을enqueue한뒤에dequeue해보면_야곰짱짱이다() {
        //given
        let expectInputValue = "야곰 짱짱"
        //when
        sut.enqueue(expectInputValue)
        let expectResult = "야곰 짱짱"
        let outputValue = sut.dequeue()
        //then
        XCTAssertEqual(expectResult, outputValue)
    }
    
    func test_큐를생성하고_혀나블짱짱과야곰짱짱을enqueue및clear한뒤에peek해보면_nil이다() {
        //given
        let expectInputValue = ["혀나블짱짱", "야곰짱짱"]
        //when
        expectInputValue.forEach { sut.enqueue($0) }
        sut.clear()
        let outputValue = sut.peek
        //then
        XCTAssertNil(outputValue)
    }
    
    func test_큐를생성하고_코든짱짱을enqueue및peek한뒤에isEmpty해보면_false이다() {
        //given
        let expectInputValue = "코든짱짱"
        //when
        sut.enqueue(expectInputValue)
        _ = sut.peek
        let outputValue = sut.isEmpty
        //then
        XCTAssertFalse(outputValue)
    }
    
    func test_큐를새로생성하고_isEmpty해보면_true이다() {
        //given
        sut = Queue()
        //when
        let outputValue = sut.isEmpty
        //then
        XCTAssertTrue(outputValue)
    }
}
