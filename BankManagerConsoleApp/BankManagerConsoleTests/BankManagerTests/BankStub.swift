//
//  BankStub.swift
//  BankManagerTests
//
//  Created by Dasan & Mary on 2023/07/19.
//

@testable import BankManagerConsoleApp

class BankStub: Openable {
    var isOpening = false
    
    func open(numberOfCustomer: Int) {
        isOpening = true
    }
}
