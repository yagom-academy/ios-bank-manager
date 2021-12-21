import XCTest
@testable import BankManagerUIApp

class LinkedListTests: XCTestCase {

    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>.init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈값에_remove_실행() {
        // when
        let result = sut.remove()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_append_와_remove_실행() {
        // given
        sut.append(1)
        
        // when
        let result = sut.remove()

        // then
        XCTAssertEqual(result, 1)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_와_remove_두번씩_실행() {
        // given
        sut.append(1)
        sut.append(2)

        // then
        XCTAssertEqual(sut.remove(), 1)
        XCTAssertFalse(sut.isEmpty)
        
        XCTAssertEqual(sut.remove(), 2)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_후에_peek_실행() {
        // given
        let item = 6
        
        // when
        sut.append(item)
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, item)
    }
    
    func test_비어있는_LinkedList에서_peek_실행() {
        // then
        XCTAssertNil(sut.peek())
    }
    
    func test_비어있는_LinkedList에서_isEmpty_값_확인() {
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_값이_있는_LinkedList에서_isEmpty_값_확인() {
        // given
        let item = 7
        sut.append(item)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
}
