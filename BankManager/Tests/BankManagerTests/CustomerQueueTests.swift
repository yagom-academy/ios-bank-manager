//
//  CustomerQueueTests.swift
//
//
//  Created by uemu on 2023/11/14.
//

import XCTest
@testable import BankManager

final class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue(list: MockLinkedList<Int>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue가_list의addNode를_호출하는지_확인() throws {
        let expectation = 1
        sut?.enqueue(value: 42)
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return XCTFail("다운캐스팅에 실패하였습니다")
        }
        
        XCTAssertEqual(mockList.callMethodCount, expectation)
    }
    
    func test_dequeue가_list의removeNode를_호출하는지_확인() throws {
        let expectation = 1
        sut?.dequeue()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return XCTFail("다운캐스팅에 실패하였습니다")
        }
        
        XCTAssertEqual(mockList.callMethodCount, expectation)
    }
    
    func test_clear가_list의removeAll을_호출하는지_확인() throws {
        let expectation = 1
        sut?.clear()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return XCTFail("다운캐스팅에 실패하였습니다")
        }
        
        XCTAssertEqual(mockList.callMethodCount, expectation)
    }
    
    func test_peek가_list의headValue를_호출하는지_확인() throws {
        let expectation = 1
        let _ = sut?.peek()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return XCTFail("다운캐스팅에 실패하였습니다")
        }
        
        XCTAssertEqual(mockList.callMethodCount, expectation)
    }
    
    func test_isEmpty가_list의checkEmpty를_호출하는지_확인() throws {
        let expectation = 1
        let _ = sut?.isEmpty()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return XCTFail("다운캐스팅에 실패하였습니다")
        }
        
        XCTAssertEqual(mockList.callMethodCount, expectation)
    }
    
    func test_count가_list의elementCount를_호출하는지_확인() throws {
        let expectation = 1
        let _ = sut?.count()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return XCTFail("다운캐스팅에 실패하였습니다")
        }
        
        XCTAssertEqual(mockList.callMethodCount, expectation)
    }
}
