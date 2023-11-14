//
//  File.swift
//  
//
//  Created by uemu on 2023/11/14.
//

import XCTest
@testable import BankManager

final class TestableLinkedList<T>: LinkedList<T> {
    private var nodeList: [Node] = []
    
    private func linkNode() {
        for node in nodeList {
            if head == nil {
                head = node
            } else {
                tail?.next = node
            }
            tail = node
            count += 1
        }
    }
    
    init(list: [T]) {
        super.init()
        list.forEach { nodeList.append(Node(value: $0)) }
        linkNode()
    }
}

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_addNode에_1을넣었을때_을() throws {
        // given
        sut?.addNode(value: 1)
        
        // when
        let result = TestableLinkedList(list: [1])
        
        // then
       
    }
}
