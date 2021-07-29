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
    
    func test_혀나블짱짱을_enqueue했을때peek해보면_혀나블짱짱이다() {
        //given
        let expectInputValue = "혀나블 짱짱"
        //when
        sut.enqueue(expectInputValue)
        let expectResult = "혀나블 짱짱"
        let outputValue = sut.peek
        //then
        XCTAssertEqual(expectResult, outputValue)
    }
    
    func test_야곰짱짱을_enqueue한뒤에dequeue해보면_야곰짱짱이다() {
        //given
        let expectInputValue = "야곰 짱짱"
        //when
        sut.enqueue(expectInputValue)
        let expectResult = "야곰 짱짱"
        let outputValue = sut.dequeue()
        //then
        XCTAssertEqual(expectResult, outputValue)
    }
    
    func test_혀나블짱짱과야곰짱짱을_enqueue하고clear한뒤에peek해보면_nil이다() {
        //given
        let expectInputValue = ["혀나블짱짱", "야곰짱짱"]
        //when
        expectInputValue.forEach { sut.enqueue($0) }
        sut.clear()
        let outputValue = sut.peek
        //then
        XCTAssertNil(outputValue)
    }
    
    func test_조이짱짱을_enqueue하고peek한뒤에isEmpty해보면_false이다() {
        //given
        let expectInputValue = "조이짱짱"
        //when
        sut.enqueue(expectInputValue)
        _ = sut.peek
        let expectResult = false
        let outputValue = sut.isEmpty
        //then
        XCTAssertEqual(expectResult, outputValue)
    }
    
    func test_어떠한값도_enqueue하지않고isEmpty해보면_true이다() {
        //given
        //when
        let outputValue = sut.isEmpty
        //then
        XCTAssertTrue(outputValue)
    }
}
