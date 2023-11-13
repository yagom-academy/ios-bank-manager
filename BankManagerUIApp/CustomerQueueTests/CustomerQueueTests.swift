//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by Kiseok on 11/14/23.
//

import XCTest
@testable import BankManagerUIApp

final class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_queue가비어있을때_isEmpty호출시_true를반환하는지() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_queue가비어있지않을때_isEmpty호출시_false를반환하는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }

}
