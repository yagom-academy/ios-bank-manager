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
}
