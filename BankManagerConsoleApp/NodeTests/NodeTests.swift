//  BankManagerConsoleApp - NodeTests.swift
//  Created by Ayaan/Dragon/som on 2022/10/31.
//  Copyright © yagom academy. All rights reserved.

import XCTest

class NodeTests: XCTestCase {
    func test_1과_2를_순서대로_Node로_생성한_후_firstNode와_secondNode를_연결할_때_firstNode의_nextNode에_value는_2와_같다() {
        // given
        let firstNode: Node = Node(data: 1)
        let secondNode: Node = Node(data: 2)
        
        // when
        firstNode.nextNode = secondNode
        
        // then
        XCTAssertEqual(firstNode.nextNode?.data, 2)
    }
    
    func test_1부터_5를_순서대로_Node로_생성한_후_각각의_Node를_순서대로_연결할_때_firstNode의_nextNode의_nextNode에_value는_3와_같다() {
        // given
        let firstNode: Node = Node(data: 1)
        let secondNode: Node = Node(data: 2)
        let thirdNode: Node = Node(data: 3)
        let fourthNode: Node = Node(data: 4)
        let fifthNode: Node = Node(data: 5)
        
        // when
        firstNode.nextNode = secondNode
        secondNode.nextNode = thirdNode
        thirdNode.nextNode = fourthNode
        fourthNode.nextNode = fifthNode
        
        // then
        XCTAssertEqual(firstNode.nextNode?.nextNode?.data, 3)
    }
}
