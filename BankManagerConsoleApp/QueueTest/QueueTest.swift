//
//  QueueTest.swift
//  QueueTest
//
//  Created by jiye Yi on 2023/03/06.
//

import XCTest

final class QueueTest: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: isEmpty test
    func test_list가비어있으면_isEmpty는_true이다() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    //MARK: enqueue test
    func test_list가비어있지않으면_isEmpty는_false이다() {
        // given
        sut.enqueue("10")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
}
