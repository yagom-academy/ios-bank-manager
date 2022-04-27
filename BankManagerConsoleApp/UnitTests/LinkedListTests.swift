//
//  LinkedListTests.swift
//  UnitTests
//
//  Created by mmim, malrang.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_linkedList_index를_통한_조회시_예상값이_나온다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        
        // when
        let result = sut.index(at: 1)?.value
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_linkedList_index를_통한_조회시_해당_index에_값이_없으면_nil을_반환한다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        
        // when
        let result = sut.index(at: 4)?.value
        
        // then
        XCTAssertNil(result)
    }

    func test_linkedList_index를_통한_조회시_음수를_입력하면_nil을_반환한다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        
        // when
        let result = sut.index(at: -1)?.value
        
        // then
        XCTAssertNil(result)
    }
    
    func test_linkedList_값을_삽입하면_해당_index에_값이_추가된다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        sut.insert(value: 10, at: 2)
        
        // when
        let result = sut.index(at: 2)?.value
        let prevResult = sut.index(at: 1)?.value
        let nextResult = sut.index(at: 3)?.value
        // then
        XCTAssertEqual(result, 10)
        XCTAssertEqual(prevResult, 2)
        XCTAssertEqual(nextResult, 3)
    }
    
    func test_linkedList_값을_삽입하면_해당_index의_이전값이_예상된_값이다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        sut.insert(value: 10, at: 2)
        
        // when
        let result = sut.index(at: 1)?.value
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_linkedList_값을_삽입하면_해당_index의_이후값이_예상된_값이다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        sut.insert(value: 10, at: 2)
        
        // when
        let result = sut.index(at: 3)?.value
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_linkedList_값을_삽입할때_존재하지않는_index를_입력하면_nil이_반환된다() {
        // given
        sut.append(value: 1)
        sut.insert(value: 10, at: 2)
        
        // when
        let result = sut.index(at: 2)
        
        // then
        XCTAssertNil(result)
    }
    
    func test_linkedList_첫번째에_값을_삽입하면_index_0의_값이_삽입한_값이다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        sut.insert(value: 10, at: 0)
        
        // when
        let result = sut.first
        
        // then
        XCTAssertEqual(result, 10)
    }
    
    func test_linkedList_첫번째에_값을_삽입하면_그다음값이_이전_첫번째_값이어야한다() {
        // given
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)
        sut.insert(value: 10, at: 0)
        
        // when
        let result = sut.index(at: 1)?.value
        
        // then
        XCTAssertEqual(result, 1)
    }
}
