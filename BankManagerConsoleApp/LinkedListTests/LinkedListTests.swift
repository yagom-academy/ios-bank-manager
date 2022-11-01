//  LinkedListTests.swift
//  LinkedListTests
//  Created by Baem & Bella on 2022/11/01.

import XCTest
@testable import BankManagerConsoleApp

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
