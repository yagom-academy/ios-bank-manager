//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by jeremy, LJ on 2022/11/01.
//

import XCTest

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
    
    func test_enqueue를_3번_했을떄_front와_rear확인() {
        //given
        let customerData1: String = "customer1"
        let customerData2: String = "customer2"
        let customerData3: String = "customer3"
        
        //when
        sut.enqueue(data: customerData1)
        sut.enqueue(data: customerData2)
        sut.enqueue(data: customerData3)
        
        //then
        XCTAssertEqual(sut.front?.data, customerData1)
        XCTAssertEqual(sut.rear?.data, customerData3)
    }
    
    func test_큐에_요소가_3개있을때_dequeue_1번_하는경우_결과값이_가장_먼저들어간_값이_나오는지_확인() {
        //given
        let customerData1: String = "customer1"
        let customerData2: String = "customer2"
        let customerData3: String = "customer3"
        
        //when
        sut.enqueue(data: customerData1)
        sut.enqueue(data: customerData2)
        sut.enqueue(data: customerData3)
        let result: String? = sut.dequeue()
        
        //then
        XCTAssertEqual(result, customerData1)
    }
    
    func test_peek이_첫번쨰_요소를_가르키는지_확인() {
        //given
        let customerData1: String = "customer1"
        
        //when
        sut.enqueue(data: customerData1)
        let result = sut.peek()
        
        //then
        XCTAssertEqual(result?.data, customerData1)
    }
}
