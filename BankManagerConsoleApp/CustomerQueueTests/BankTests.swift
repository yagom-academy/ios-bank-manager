//
//  BankTests.swift
//  CustomerQueueTests
//
//  Created by 이원빈 on 2022/07/04.
//

import XCTest

class BankTests: XCTestCase {
    var sut: Bank!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Bank(employee: BankManager(), customer: CustomerQueue())
        
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_updateCustomerQueue를호출했을때_randomNumber가_유효한_범위내에있다면_True를반환한다() {
        //given
        let validArrange = Array<Int>(10...30)
        //when
        sut.updateCustomerQueue()
        let randomNumber = sut.randomNumberOfCustomer
        let result = validArrange.contains(randomNumber)
        //then
        XCTAssertTrue(result)
    }
    
    func test_updateCustomerQueue를호출했을때_randomNumber가_유효하지않은_범위내에있다면_False를반환한다() {
        //given
        
        //when
        sut.updateCustomerQueue()
        let randomNumber = sut.randomNumberOfCustomer
        //then
        XCTAssertFalse(randomNumber < 10 || randomNumber > 30)
    }
}
