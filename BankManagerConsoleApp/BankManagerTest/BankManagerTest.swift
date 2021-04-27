//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yunhwa on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

class BankManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_totalProcessedTime() {
        let bank = Bank()
        let totalTime: Double = Double(bank.totalCustomer) * 0.7
        XCTAssertEqual(bank.totalProcessedTime(), totalTime)
    }
    
    func test_WaitingQueue_enqueue() {
        var waitingQueue = WaitingQueue()
        XCTAssertEqual(waitingQueue.enqueue(Customer(waitingNumber: 1)), .success(Customer(waitingNumber: 1)))
    }
    
    func test_WaitingQueue_emptyQueue_dequeue() {
        var waitingQueue = WaitingQueue()
        XCTAssertEqual(waitingQueue.dequeue(), .failure(.queueIsEmpty))
    }
    
    func test_WaitingQueue_dequeue() {
        var waitingQueue = WaitingQueue([Customer(waitingNumber: 1)])
        
        XCTAssertEqual(waitingQueue.dequeue(), .success(Customer(waitingNumber: 1)))
    }
    
    func test_WaitingQueue_emptyQueue_first() {
        let waitingQueue = WaitingQueue()
        XCTAssertEqual(waitingQueue.first, nil)
    }
    
    func test_WaitingQueue_Queue_first() {
        let waitingQueue = WaitingQueue([Customer(waitingNumber: 1)])
        XCTAssertEqual(waitingQueue.first, Customer(waitingNumber: 1))
    }
}
