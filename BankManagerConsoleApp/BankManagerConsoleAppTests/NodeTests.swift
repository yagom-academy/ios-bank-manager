//
//  NodeTests.swift
//  BankManagerConsoleAppTests
//
//  Created by hoon, minsup on 2023/07/11.
//

import XCTest
@testable import BankManagerConsoleApp

final class NodeTests: XCTestCase {
    func test_노드를_0으로_초기화하면_value에_0이_저장된다() {
        // given
        let input = Node(0)
        
        // when
        let expectation = 0
        
        // then
        XCTAssertEqual(input.value, expectation)
    }
    
    func test_처음_노드에_1로_초기화된_다음_노드를_연결하면_처음_노드에서_다음_노드의_밸류인_1에_접근할_수_있다() {
        // given
        let input1 = Node(0)
        let input2 = Node(1)
        input1.next = input2
        
        // when
        let expectation = 1
        
        // then
        XCTAssertEqual(input1.next?.value, expectation)
    }
}
