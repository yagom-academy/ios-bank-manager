//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by 리지, 무리 on 2023/03/06.
//

import XCTest
@testable import BankManagerUIApp
final class LinkedListTest: XCTestCase {
    var sut: LinkedList<String>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_값이없는경우_isEmpty가_true다() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_값이있는경우_isEmpty가_false다() {
        //given
        sut.enqueue("1")
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
}
