//
//  BankTests.swift
//  BankManagerConsoleAppTests
//
//  Created by musun129 on 2021/04/30.
//

import XCTest

class BankTests: XCTestCase {}

class NotificationBoardTests: XCTestCase {
    var sut: Bank.NotificationBoard!
    var defaultCustomerQueue: Bank.CustomerQueue!
    var strangeCustomerQueue: Bank.CustomerQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Bank.NotificationBoard()
        defaultCustomerQueue = Bank.CustomerQueue(name: "default")
        strangeCustomerQueue = Bank.CustomerQueue(name: "strange")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        defaultCustomerQueue = nil
        strangeCustomerQueue = nil
    }

    func test_addObserver() {
        sut.addObserver(defaultCustomerQueue)

        XCTAssertEqual(sut.observers[0].name, defaultCustomerQueue.name)
    }

    func test_removeObserver() {
        sut.addObserver(defaultCustomerQueue)
        sut.addObserver(strangeCustomerQueue)
        sut.removeObserver(defaultCustomerQueue)

        XCTAssertEqual(sut.observers[0].name, strangeCustomerQueue.name)
    }

    func test_call을_하면_floatOnBoard에_의해_모든_Observer의_queue가_🍺진다() {
        let teller = Bank.Teller(counterNumber: 0)

        defaultCustomerQueue.enqueue(Bank.Customer(waitingNumber: 0))
        strangeCustomerQueue.enqueue(Bank.Customer(waitingNumber: 1))
        defaultCustomerQueue.enqueue(Bank.Customer(waitingNumber: 2))
        strangeCustomerQueue.enqueue(Bank.Customer(waitingNumber: 3))

        sut.addObserver(defaultCustomerQueue)
        sut.addObserver(strangeCustomerQueue)
        sut.call(by: teller)

        for observer in sut.observers {
            XCTAssertTrue(observer.queue.isEmpty)
        }
    }
}
