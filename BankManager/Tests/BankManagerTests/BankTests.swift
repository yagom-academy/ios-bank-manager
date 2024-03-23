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
        sut = Bank()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test고객추가가정상적으로이루어지는지확인할수있다() {
        sut.addCustomer()

        XCTAssertFalse(sut.waitingCustomers.isEmpty)
    }

    func test은행업무종료시모든고객이_Queue에서dequeue되었는지확인할수있다() async throws {
        var isWorking: Bool = true

        sut.addCustomer()

        while isWorking {
            isWorking = try await sut.preceedBankWork()
        }

        XCTAssertTrue(sut.waitingCustomers.isEmpty)
    }
}
