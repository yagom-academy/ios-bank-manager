//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Dasan & Mary on 2023/07/19.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    private var sut: BankManagerMock!
    private var bank: BankStub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        bank = BankStub()
        sut = BankManagerMock(bank: bank)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        bank = nil
        sut = nil
    }
    
    func test_runProgram메서드실행후_2를입력하였때_bank의_isOpening은_false이다() {
        // given
        let enterable = EnterableTestStruct(inputValue: "2")
        sut.runProgram(enterable: enterable)
        
        // when
        let result = bank.isOpening
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_runProgram메서드실행후_5을입력하였을때_bank의_isOpening은_false이다() {
        // given
        let enterable = EnterableTestStruct(inputValue: "5")
        sut.runProgram(enterable: enterable)
        
        // when
        let result = bank.isOpening
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_runProgram메서드실행후_1을입력하였을때_bank의_isOpening은_true이다() {
        // given
        let enterable = EnterableTestStruct(inputValue: "1")
        sut.runProgram(enterable: enterable)
        
        // when
        let result = bank.isOpening
        
        // then
        XCTAssertTrue(result)
    }
}
