//
//  ConsoleAppTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

class BankTest: XCTestCase {
    struct DummyBank: Bank {
        var ticketNumber: Int = 0
    }
    var dummyBank = DummyBank()
    
    func test_Bank_getNewTicket_for_firstTicketNumber() {
        let firstTicketNumber = dummyBank.getNewTicket()
        XCTAssertEqual(firstTicketNumber, 1)
    }
    
    func test_Bank_getNewTicket_for_middleTicketNumber() {
        for _ in 1...10 {
            dummyBank.getNewTicket()
        }
        let middleTicketNumber = dummyBank.getNewTicket()
        XCTAssertEqual(middleTicketNumber, 11)
    }
    
    func test_Bank_getTimeDuration_for_only_OneCustomer() {
        dummyBank.getNewTicket()
        let minimumTimeDuration = dummyBank.getTimeDuration()
        XCTAssertEqual(minimumTimeDuration, "0.70")
    }
    
    func test_Bank_getTimeDuration_for_only_30_Customer() {
        for _ in 1...30 {
            dummyBank.getNewTicket()
        }
        let minimumTimeDuration = dummyBank.getTimeDuration()
        XCTAssertEqual(minimumTimeDuration, "21.00")
    }
    
    func test_Bank_resetTicketNumeber() {
        for _ in 1...30 {
            dummyBank.getNewTicket()
        }
        dummyBank.resetTicketNumber()
        XCTAssertEqual(dummyBank.ticketNumber, 0)
    }
}

