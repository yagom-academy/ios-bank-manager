//
//  ConsoleAppTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

class BankTest: XCTestCase {
    var dummyBank: Bank?
    
    override func setUpWithError() throws {
        dummyBank = Bank(numberOfBankTeller: 1)
    }
    
    override func tearDownWithError() throws {
        dummyBank = nil
    }
    
    func test_getNewTicketNumber_호출시_ticketNumber_증가하는지() {
        for _ in 1...10 {
            dummyBank?.getNewTicketNumber()
        }
        
        let tenthTicketNumber = dummyBank?.ticketNumber
        
        XCTAssertEqual(tenthTicketNumber, 10)
    }
    
    func test_getNewTicket_호출시_ticketNumber_반환이_정상적으로되는지() {
        let firstTicketNumber = dummyBank?.getNewTicketNumber()
        XCTAssertEqual(firstTicketNumber, 1)
    }
    
    func test_ticketNumber가_closeBank_호출시_0으로_초기화되는지_테스트() {
        for _ in 1...Int.random(in: 10...30) {
            dummyBank?.getNewTicketNumber()
        }
        dummyBank?.openTime = CFAbsoluteTimeGetCurrent() //closeBank의 openTime을 지정해주기 위해 필요
        dummyBank?.closeBank()
        let resettedTicketNumber = dummyBank?.ticketNumber
        
        XCTAssertEqual(resettedTicketNumber, 0)
    }
}
