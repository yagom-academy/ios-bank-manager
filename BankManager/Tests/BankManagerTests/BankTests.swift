//
//  BankTests.swift
//
//
//  Created by Hamzzi, Diana on 3/21/24.
//

import XCTest
@testable import BankManager

final class BankTests: XCTestCase {
    private var sut: Bank!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Bank(bankers: [], waitingCustomers: Queue<Customer>())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_고객추가가_정상적으로이루어지는지_확인할수있다() {
        sut.addCustomer()
        
        XCTAssertFalse(sut.waitingCustomers.isEmpty)
    }
    
    func test_은행원추가가_정상적으로이루어지는지_확인할수있다() {
        sut.addBanker(Banker())
        
        XCTAssertFalse(sut.bankers.isEmpty)
    }
    
    func test_은행업무가_정상적으로이루어지는지_확인할수있다() async {
        sut.addCustomer()
        await sut.processWorkforOneBanker(Banker())
        XCTAssertTrue(sut.waitingCustomers.isEmpty)
    }
}
