//
//  TicketGeneratorTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/03.
//

import XCTest

class TicketGeneratorTest: XCTestCase {
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func test_ticketNumber의_초기값이_0인지() {
        XCTAssertEqual(TicketGenerator.ticketNumber, 0)
    }

    func test_getNewTicket_첫_호출시_반환값이_1인지() {
        XCTAssertEqual(TicketGenerator.getNewTicketNumber(), 1)
    }

    func test_resetTicketNumber_호출시_ticketNumber가_0으로_초기화되는지() {
        for _ in 1...Int.random(in: 10...30) {
            TicketGenerator.getNewTicketNumber()
        }
        TicketGenerator.resetTicketNumberToZero()
        XCTAssertEqual(TicketGenerator.ticketNumber, 0)
    }
}
