//
//  NodeTests.swift
//  NodeTests
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import XCTest

class NodeTests: XCTestCase {
    var sut: Node<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_Node에_데이터값을입력하면_값이초기화가되는지() {
        // given
        let value = 10
        // when
        sut = Node(value)
        let result = sut.data
        // then
        XCTAssertEqual(result, value)
    }
    
    func test_Node에_처음데이터값을입력하면_next값이nil로초기화되는지() {
        // given
        let value = 10
        // when
        sut = Node(value)
        let result = sut.next
        // then
        XCTAssertNil(result)
    }
}
