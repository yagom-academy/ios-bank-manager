//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by LeeChiheon on 2022/06/27.
//

import XCTest

class LinkedListTest: XCTestCase {

    var sut: LinkedList<Int>?
    
    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        print("테스트 성공")
    }
}
