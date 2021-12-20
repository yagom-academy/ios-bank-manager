//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by JeongTaek Han on 2021/12/20.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    var sutLinkedList: LinkedList<Int>!

    override func setUpWithError() throws {
        sutLinkedList = LinkedList()
    }

    override func tearDownWithError() throws {
        sutLinkedList = nil
    }

    func test_1_2_3을_enqueue_한_후에_dequeue_하면_1을_반환해야한다() throws {
        sutLinkedList.enqueue(data: 1)
        sutLinkedList.enqueue(data: 2)
        sutLinkedList.enqueue(data: 3)
        
        do {
            let result = try sutLinkedList.dequeue()
            XCTAssertEqual(result, 1)
        } catch LinkedListError.dequeueFail {
            XCTFail()
        }
    }
    
    func test_LinkedList가_비어있을때_dequeue_하면_오류를_반환해야한다() throws {
        XCTAssertThrowsError(try sutLinkedList.dequeue())
    }
}
