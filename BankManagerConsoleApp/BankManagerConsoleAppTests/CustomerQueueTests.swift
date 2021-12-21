//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Seul Mac on 2021/12/21.
//

import XCTest

class CustomerQueueTests: XCTestCase {
    
    var sutCustomerQueue: CustomerQueue<Int>!

    override func setUpWithError() throws {
        sutCustomerQueue = CustomerQueue<Int>()
    }

    override func tearDownWithError() throws {
        sutCustomerQueue = nil
    }
    
    func test_1_2_3을_enqueue_한_후에_dequeue_하면_1을_반환해야한다() throws {
        sutCustomerQueue.enqueue(data: 1)
        sutCustomerQueue.enqueue(data: 2)
        sutCustomerQueue.enqueue(data: 3)
        
        do {
            let result = try sutCustomerQueue.dequeue()
            XCTAssertEqual(result, 1)
        } catch LinkedListError.dataDoesNotExist {
            XCTFail()
        }
    }
    
    func test_9_10_11을_enqueue_한_후에_dequeue_두번_하면_10을_반환해야한다() throws {
        sutCustomerQueue.enqueue(data: 9)
        sutCustomerQueue.enqueue(data: 10)
        sutCustomerQueue.enqueue(data: 11)
        
        do {
            let _ = try sutCustomerQueue.dequeue()
            let result = try sutCustomerQueue.dequeue()
            XCTAssertEqual(result, 10)
        } catch LinkedListError.dataDoesNotExist {
            XCTFail()
        }
    }
    
    func test_CustomerQueue가_비어있을때_dequeue_하면_오류를_던져야한다() throws {
        XCTAssertThrowsError(try sutCustomerQueue.dequeue())
    }
    
    func test_9_10_11을_enqueue_한_후에_peek하면_9를_반환해야한다() throws {
        sutCustomerQueue.enqueue(data: 9)
        sutCustomerQueue.enqueue(data: 10)
        sutCustomerQueue.enqueue(data: 11)
        
        do {
            let result = try sutCustomerQueue.peek()
            XCTAssertEqual(result, 9)
        } catch LinkedListError.dataDoesNotExist {
            XCTFail()
        }
    }
    
    func test_CustomerQueue가_비어있을때_peek하면_오류를_던져야한다() throws {
        XCTAssertThrowsError(try sutCustomerQueue.peek())
    }
}
