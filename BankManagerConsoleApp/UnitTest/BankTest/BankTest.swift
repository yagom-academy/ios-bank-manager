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
    
    func test_reportResult실행시_예상하는_메시지가_출력된다() {
        // given
        let totalCustomer = 1
        let processTime: CFAbsoluteTime = 1.1
        let roundedProcessTime = round(processTime * 100) / 100
        let expectedMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(roundedProcessTime)초 입니다."
        
        // when
        let report = sut.reportResult(totalCustomer: totalCustomer,
                                      processTime: processTime)
        //then
        XCTAssertEqual(expectedMessage, report)
        
    }
    
    //    func test_open_실행시_department의_respond파라미터로_Customer가_전달된다() {
    //        // given
    //        let expectation = XCTestExpectation()
    //
    //        let testTotalCustomer = 10
    //        let testValue = "9"
    //        let dummyCustomer = Customer(numberTicket: testValue)
    //        mockQueue.dummyCustomer = dummyCustomer
    //
    //        // when
    //        sut.open(totalCustomer: testTotalCustomer)
    //
    //        // then
    //        if let business = dummyCustomer.business {
    //            switch business {
    //            case .deposit:
    //                XCTAssertEqual(dummyCustomer, mockDepositDepartment.respondCustomer)
    //            case .loan:
    //                XCTAssertEqual(dummyCustomer, mockLoanDepartment.respondCustomer)
    //            }
    //        }
    
    //.  }
}
