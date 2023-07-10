//
//  WaitingLineQueueTests.swift
//  WaitingLineQueueTests
//
//  Created by Erick, Serena on 2023/07/10.
//

import XCTest

@testable import BankManagerConsoleApp

final class WaitingLineQueueTests: XCTestCase {
    var sut: WaitingLineQueue<String>?
    
    override func setUpWithError() throws {
        sut = WaitingLineQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Queue가_비었을때_isEmpty가_true입니다() {
        // given
        let expectaion = true
        // when
        let result = sut?.isEmpty
        // then
        XCTAssertEqual(result, expectaion)
    }
}
