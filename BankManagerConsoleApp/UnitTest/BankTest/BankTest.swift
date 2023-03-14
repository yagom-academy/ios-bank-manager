//
//  BankTest.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

final class BankTest: XCTestCase {
    
    var sut: Bank!
    var mockQueue: MockQueue!
    
    override func setUpWithError() throws {
        mockQueue = MockQueue()
        sut = Bank(loanBankerCount: 1, depositBankerCount: 1, customerQueue: mockQueue)
    }

    override func tearDownWithError() throws {
        mockQueue = nil
        sut = nil
    }

    func test_open_실행시_totalCustomer만큼_enqueue가_진행된다() {
        //given
        let expectation = 20
        
        //when
        sut.open(totalCustomer: expectation)
        
        //then
        let result = mockQueue.enqueueCount
        XCTAssertEqual(expectation, result)
    }

 

}
