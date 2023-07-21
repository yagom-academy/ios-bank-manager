//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Dasan & Mary on 2023/07/19.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    private var sut: BankManager!
    private var bank: BankStub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        bank = BankStub()
        sut = BankManager(bank: bank)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        bank = nil
        sut = nil
    }
    
    func test_runProgram메서드실행후_2를입력하였때_bank의_isOpening은_false이다() {
        // given
        sut.runProgram()
        
        // when : 2을 입력하면
        let result = bank.isOpening
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_runProgram메서드실행후_5을입력후_2를입력하였을때_bank의_isOpening은_false이다() {
        // given
        sut.runProgram()
        
        // when : 5을 입력하고 2를 입력하면
        let result = bank.isOpening
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_runProgram메서드실행후_1을입력후_2를입력하였을때_bank의_isOpening은_true이다() {
        // given
        sut.runProgram()
        
        // when : 1을 입력하고 2를 입력하면
        let result = bank.isOpening
        
        // then
        XCTAssertTrue(result)
    }
}
