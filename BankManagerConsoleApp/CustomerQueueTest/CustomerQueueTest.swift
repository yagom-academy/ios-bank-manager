//
//  CustomerQueueTest.swift
//  CustomerQueueTest
//
//  Created by 임지성 on 2021/12/20.
//

import XCTest


class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue시_element가_정상적으로_들어가는지() {
        sut.enqueue(1)
        
        
    }
}
