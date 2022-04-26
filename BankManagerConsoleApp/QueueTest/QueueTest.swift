//
//  QueueTest.swift
//  QueueTest
//
//  Created by LIMGAUI on 2022/04/26.
//

import XCTest
@testable import Pods_BankManagerConsoleApp

class QueueTest: XCTestCase {
    var sut: Queue<String>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test() {
        let data = "data"
        sut.enqueue(data: data)
        
        let result = sut.peek
        
        
        XCTAssertEqual(result, data)
    }
}
