//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by jeremy, LJ on 2022/11/01.
//

import XCTest
@testable import BankManagerConsoleApp

class BankManagerConsoleAppTest: XCTestCase {
    var sut1: CustomerQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut1 = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut1 = nil
    }
    
    func test_node에_data가_잘들어가는지() {
        //given
        let customerData: String = "customer01"
        
        //when
        let node = Node(data: customerData)
        
        //then
        XCTAssertEqual(node.data, "customer01")
    }
}
