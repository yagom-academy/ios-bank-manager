//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Kiseok on 11/13/23.
//

import XCTest
@testable import BankManagerUIApp

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}
