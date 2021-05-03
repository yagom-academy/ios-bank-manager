//
//  OperationTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/02.
//

import XCTest
@testable import BankManagerConsoleApp

class HandleCustomerOperationTest: XCTestCase {
    var dummyOperation: HandleCustomerOperation?
    override func setUpWithError() throws {
        dummyOperation = HandleCustomerOperation(customer: Customer(ticketNumber: 1, priority: .VVIP, task: .loan))
    }

    override func tearDownWithError() throws {
        dummyOperation = nil
    }
    
    func test_handleBanking() {
        guard let operation = dummyOperation else {
            XCTFail("dummyOperation is nil")
            return
        }
        operation.main()
    }

}
