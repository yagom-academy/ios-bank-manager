//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by 변재은 on 2022/06/28.
//

import XCTest
@testable import BankManagerConsoleApp

class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CustomerQueue<Int>
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
}
