//
//  BankCustomerTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Gundy, jpush on 2022/11/04.
//

import XCTest
import BankCustomerQueue

class BankCustomerTests: XCTestCase {
    var sut: BankCustomerQueue<BankCustomer> = .init()
    
    func test_when_enqueue_bank_customer_dequeue_then_return_valid_value() {
        // given
        let customer: BankCustomer = .init()
        
        // when
        sut.enqueue(customer)
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(customer.waitingNumber, result?.waitingNumber)
    }
}
