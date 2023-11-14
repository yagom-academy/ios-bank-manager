//
//  File.swift
//  
//
//  Created by uemu on 2023/11/14.
//

import XCTest
@testable import BankManager

final class TestableLinkedList<T: Equatable>: LinkedList<T> {
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
    
    override init() {
        super.init()
    }
    
    init(list: [T]) {
        super.init()
        list.forEach { nodeList.append(Node(value: $0)) }
        linkNode()
    }
}

final class LinkedListTests: XCTestCase {
    var sut: TestableLinkedList<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_addNode에_1_2을넣었을때_expectation과_일치하는지_확인() throws {
        let expectation = TestableLinkedList<Int>(list: [1, 2])
        
        sut = TestableLinkedList<Int>()
        sut?.addNode(value: 1)
        sut?.addNode(value: 2)
        
        XCTAssertEqual(sut, expectation)
    }
    
    func test_1_2_3이_들어있는_sut의_removeNode를_호출했을때_expectation과_일치하는지_확인() throws {
        let expectation = TestableLinkedList<Int>(list: [2, 3])
        
        sut = TestableLinkedList<Int>(list: [1, 2, 3])
        let _ = sut?.removeNode()
        
        XCTAssertEqual(sut, expectation)
    }
    
    func test_1_2_3이_들어있는_sut의_removeNode를_호출했을때_리턴값이_expectation과_일치하는지_확인() throws {
        let expectation = 1
        
        sut = TestableLinkedList<Int>(list: [1, 2, 3])
        let result = sut?.removeNode()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_1_2_3이_들어있는_sut의_removeAll을_호출했을때_expectation과_일치하는지_확인() throws {
        let expectation = TestableLinkedList<Int>()
        
        sut = TestableLinkedList<Int>(list: [1, 2, 3])
        sut?.removeAll()
        
        XCTAssertEqual(sut, expectation)
    }
    
    func test_1_2_3이_들어있는_sut의_headValue를_호출했을때_expectation과_일치하는지_확인() throws {
        let expectation = 1
        
        sut = TestableLinkedList<Int>(list: [1, 2, 3])
        let result = sut?.headValue
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_비어있는sut의_checkEmpty를_호출했을때_expectation과_일치하는지_확인() throws {
        let expectation = true
        
        sut = TestableLinkedList<Int>()
        let result = sut?.checkEmpty
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_1_2_3이_들어있는_sut의_elementCount를_호출했을때_expectation과_일치하는지_확인() throws {
        let expectation = 3
        
        sut = TestableLinkedList<Int>(list: [1, 2, 3])
        let result = sut?.elementCount
        
        XCTAssertEqual(result, expectation)
    }
}

extension TestableLinkedList: Equatable {
    static func == (lhs: TestableLinkedList, rhs: TestableLinkedList) -> Bool {
        var currentLhs = lhs.head
        var currentRhs = rhs.head
        
        while currentLhs != nil || currentRhs != nil {
            guard currentLhs != nil && currentRhs != nil else {
                return false
            }
            
            guard currentLhs?.value == currentRhs?.value else {
                return false
            }
            
            currentLhs = currentLhs?.next
            currentRhs = currentRhs?.next
        }
        return true
    }
}
