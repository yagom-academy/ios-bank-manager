//
//  BankQueueTests.swift
//  
//
//  Created by hyunMac on 11/14/23.
//

import XCTest
@testable import BankManager

final class BankQueueTests: XCTestCase {
    var sut: BankQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = BankQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_enqueue로_데이터1을_넣었을때_peek실행시_1이출력된다() {
        sut.enqueue(data: 1)
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 1)
    }
    
    func test_enqeue로_데이터_1_2를넣고_dequeue실행후_peek실행시_2가출력된다(){
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.dequeue()
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 2)
    }
    
    func test_큐에요소를_추가하고_clear했을시_isEmpty가_true이다() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        sut.clear()
        let result = sut.isEmpty()
        
        XCTAssertEqual(result, true)
    }
}
