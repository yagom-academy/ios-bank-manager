//
//  DummyCustomerReceiver.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest
@testable import BankManagerConsoleApp

class DummyCustomerReceiver: Receivable {
    var testValue = 0
    
    func receiveCustomer() -> Int {
        return testValue
    }
    
}
