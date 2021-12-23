import XCTest
@testable import BankManagerUIApp

class LinkedListTests: XCTestCase {

    typealias Value = Int
    
    var sut: LinkedList<Value>!
    
    let items = [10,20]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Value>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈값에_remove_실행() {
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_append_와_remove_실행() {
        // given
        let item = items[0]
        sut.append(item)
        
        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, item)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_와_remove_두번씩_실행() {
        // given
        let firstItem = items[0]
        let secondItem = items[1]
        sut.append(firstItem)
        sut.append(secondItem)

        // then
        XCTAssertEqual(sut.removeFirst(), firstItem)
        XCTAssertFalse(sut.isEmpty)
        
        XCTAssertEqual(sut.removeFirst(), secondItem)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_후에_peek_실행() {
        // given
        let item = items[0]
        
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
        let item = items[0]
        sut.append(item)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
}
