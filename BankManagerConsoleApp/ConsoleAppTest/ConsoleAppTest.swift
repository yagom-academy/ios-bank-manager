//
//  ConsoleAppTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

class ConsoleAppTest: XCTestCase {
    struct DummyBank: Bank {
        var ticketNumber: Int = 0
    }
    var dummyBank = DummyBank()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
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
}
