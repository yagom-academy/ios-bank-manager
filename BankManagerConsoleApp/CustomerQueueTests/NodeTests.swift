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

    func test_Node에_초기화구문을이용해서_값을입력하면_data가_해당값으로초기화가되는지() {
        // given
        let value = 10
        // when
        sut = Node(value)
        let result = sut.data
        // then
        XCTAssertEqual(result, value)
    }
    
    func test_Node에_초기화구문을이용해서_값을입력하면_next값이_nil로초기화되는지() {
        // given
        let value = 10
        // when
        sut = Node(value)
        let result = sut.next
        // then
        XCTAssertNil(result)
    }
}
