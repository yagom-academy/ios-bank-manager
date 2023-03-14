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
    var mockLoanDepartment: MockDepartment!
    var mockDepositDepartment: MockDepartment!
    
    override func setUpWithError() throws {
        mockQueue = MockQueue()
        mockLoanDepartment = MockDepartment()
        mockDepositDepartment = MockDepartment()
        sut = Bank(loanDepartment: mockLoanDepartment,
                   depositDepartment: mockDepositDepartment,
                   customerQueue: mockQueue)
    }

    override func tearDownWithError() throws {
        mockQueue = nil
        mockLoanDepartment = nil
        mockDepositDepartment = nil
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
    
    func test_open_실행시_department의_respond파라미터로_Customer가_전달된다() {
        // given
        let testTotalCustomer = 10
        let testValue = "1"
        let dummyCustomer = Customer(numberTicket: testValue)
        mockQueue.dummyCustomer = dummyCustomer
        
        // when
        sut.open(totalCustomer: testTotalCustomer)
        
        // then
        if let business = dummyCustomer.business {
            switch business {
            case .deposit:
                XCTAssertEqual(dummyCustomer, mockDepositDepartment.respondCustomer)
            case .loan:
                XCTAssertEqual(dummyCustomer, mockLoanDepartment.respondCustomer)
            }
        }
    }
}
