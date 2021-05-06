//
//  BankTests.swift
//  BankManagerConsoleAppTests
//
//  Created by musun129 on 2021/04/30.
//

import XCTest

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

    func test_call을_하면_floatOnBoard에_의해_모든_Observer의_queue가_비워진다() {
        let teller = Bank.Teller(counterNumber: 0)

        defaultCustomerQueue.enqueue(Bank.Customer(waitingNumber: 0))
        strangeCustomerQueue.enqueue(Bank.Customer(waitingNumber: 1))
        defaultCustomerQueue.enqueue(Bank.Customer(waitingNumber: 2))
        strangeCustomerQueue.enqueue(Bank.Customer(waitingNumber: 3))

        sut.addObserver(defaultCustomerQueue)
        sut.addObserver(strangeCustomerQueue)
        sut.call(sender: teller)

        for observer in sut.observers {
            XCTAssertTrue(observer.queue.isEmpty)
        }
    }
}

class TellerTests: XCTestCase {
    let bank = Bank()
    let sut = Bank.Teller(counterNumber: 5)
    let notificationBoard = Bank.NotificationBoard()

    func test_teller는_원하는시간정도로_업무시간을_소요하는가() {
        func checkTime() -> Double {
            let workStart = ProcessInfo.processInfo.systemUptime
            sut.work(forCustomerOf: 4, sender: notificationBoard)
            let workEnd = ProcessInfo.processInfo.systemUptime
            return workEnd - workStart
        }

        let timeCheck = checkTime()

        XCTAssertGreaterThan(timeCheck, 0.7)
        XCTAssertLessThan(timeCheck, 0.8)
    }
}

class CustomerQueueTest: XCTestCase {
    var sut: Bank.CustomerQueue!
    var customer: Bank.Customer!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Bank.CustomerQueue(name: "큐큐큐큐큐큐")
        customer = Bank.Customer(waitingNumber: 0)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        customer = nil
    }

    func test_빈queue에_enqueue한경우_queue의_첫번째요소의waitingNumber와_넣어준customer인스턴스의_waitingNumber가_같은가() {
        sut.enqueue(customer)

        XCTAssertEqual(sut.queue[0].waitingNumber, customer.waitingNumber)
    }

    func test_queue에서_dequeue한경우_요소가있는경우_첫번째인덱스의_요소가나오는가() {
        sut.enqueue(customer)

        XCTAssertEqual(sut.dequeue()!.waitingNumber, customer.waitingNumber)
    }

    func test_빈queue에서_dequeue한경우_nil이_나오는가() {
        XCTAssertNil(sut.dequeue())
    }
}
