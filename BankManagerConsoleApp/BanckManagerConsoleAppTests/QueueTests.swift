//
//  QueueTests.swift
//  BanckManagerConsoleAppTests
//
//  Created by 고은 on 2021/12/20.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue로_1_2_3을넣으면_first가_1을반환하는지() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        
        XCTAssertEqual(sut.first, 5)
    }
}
