//
//  ConsoleAppTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

class BankTest: XCTestCase {
    var dummyBank = Bank(numberOfBankTeller: 1)
    
    func test_Bank_getNewTicket_for_firstTicketNumber() {
        let firstTicketNumber = dummyBank.getNewTicketNumber()
        XCTAssertEqual(firstTicketNumber, 1)
    }
    
    func test_Bank_getNewTicket_for_middleTicketNumber() {
        for _ in 1...10 {
            dummyBank.getNewTicketNumber()
        }
        let middleTicketNumber = dummyBank.getNewTicketNumber()
        XCTAssertEqual(middleTicketNumber, 11)
    }
    
    func test_Bank_ticketNumber가_openBank_호출시_0으로_초기화되는지_테스트() {
        for _ in 1...Int.random(in: 10...30) {
            dummyBank.getNewTicketNumber()
        }
        dummyBank.openBank()
        let ticketNumber = dummyBank.ticketNumber
        XCTAssertEqual(ticketNumber, 0)
    }
}
