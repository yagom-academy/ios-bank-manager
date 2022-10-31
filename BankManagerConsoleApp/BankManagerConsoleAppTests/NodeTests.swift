//
//  NodeTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

import XCTest
@testable import BankManagerConsoleApp

class NodeTests: XCTestCase {
    func test_Node가Int타입1로_초기화가잘이루어지는지() {
        let result = Node<Int>(data: 1)
        
        XCTAssertEqual(result.bringNodeData(), 1)
    }
    
    func test_Node의Next가_지정한Node를가르키는지() {
        let node = Node<Int>(data: 1)
        let result = Node<Int>(data: 2, next: node)
        
        XCTAssertEqual(result.bringNextNode()?.bringNodeData(), node.bringNodeData())
    }
}
