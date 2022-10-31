//
//  NodeTests.swift
//  NodeTests
//
//  Created by Ayaan/Dragon/som on 2022/10/31.
//

import XCTest

class NodeTests: XCTestCase {
    func test_1과_2를_순서대로_Node로_생성한_후_firstNode와_secondNode를_연결할_때_firstNode의_nextNode에_value는_2와_같다() {
        // given
        let firstNode: Node = Node(value: 1)
        let secondNode: Node = Node(value: 2)
        
        // when
        firstNode.nextNode = secondNode
        
        // then
        XCTAssertEqual(firstNode.nextNode?.value, 2)
    }
    
    func test_1부터_5를_순서대로_Node로_생성한_후_각각의_Node를_순서대로_연결할_때_firstNode의_nextNode의_nextNode에_value는_3와_같다() {
        // given
        let firstNode: Node = Node(value: 1)
        let secondNode: Node = Node(value: 2)
        let thirdNode: Node = Node(value: 3)
        let fourthNode: Node = Node(value: 4)
        let fifthNode: Node = Node(value: 5)
        
        // when
        firstNode.nextNode = secondNode
        secondNode.nextNode = thirdNode
        thirdNode.nextNode = fourthNode
        fourthNode.nextNode = fifthNode
        
        // then
        XCTAssertEqual(firstNode.nextNode?.nextNode?.value, 3)
    }
}
