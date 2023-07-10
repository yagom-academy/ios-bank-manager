//
//  QueueTests.swift
//  QueueTests
//
//  Created by Dasan & Mary on 2023/07/10.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTests: XCTestCase {
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_isEmpty_조건없이_queue의_isEmpty를호출할때_isEmpty는_true이다() {
        // given, when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
