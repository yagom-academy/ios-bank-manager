//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by jeremy, LJ on 2022/11/01.
//

import XCTest
@testable import BankManagerConsoleApp

class BankManagerConsoleAppTests: XCTestCase {
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
        let customerData: String = "customer1"
        
        //when
        let node = Node(data: customerData)
        
        //then
        XCTAssertEqual(node.data, "customer1")
    }
    
    func test_createNode가_Node를_잘만들어주는지() {
        //given
        let customerData: String = "customer2"
        
        //when
        let result = sut.createNode(data: customerData)
        
        //then
        XCTAssertEqual(result.data, customerData)
    }
    
    func test_enqueue_Node1개를_넣었을때_front와rear_모두_같은_Node를_가리키는지() {
        //given
        let customerData: String = "customer3"
        
        //when
        sut.enqueue(data: customerData)
        
        //then
        XCTAssertEqual(sut.front?.data, sut.rear?.data)
    }
}
