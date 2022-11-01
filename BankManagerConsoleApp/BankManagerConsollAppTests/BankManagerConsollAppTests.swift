//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by jeremy, LJ on 2022/11/01.
//

import XCTest
@testable import BankManagerConsoleApp

class BankManagerConsoleAppTest: XCTestCase {
    var sut: CustomerQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_node에_data가_잘들어가는지() {
        //given
        let customerData: String = "customer01"
        
        //when
        let node = Node(data: customerData)
        
        //then
        XCTAssertEqual(node.data, "customer01")
    }
    
    func test_createNode가_Node를_잘만들어주는지() {
        //given
        let customerData: String = "customer2"
        
        //when
        let result = sut.createNode(data: customerData)
        
        //then
        XCTAssertEqual(result.data, customerData)
    }
}
