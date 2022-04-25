//
//  BankWaitingQueueTest.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/25.
//

import XCTest

class BankWaitingQueueTest: XCTestCase {
    var sut: BankWaitingQueue<MockList<Int>>!

    override func setUpWithError() throws {
        sut = BankWaitingQueue.init(MockList<Int>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
}
