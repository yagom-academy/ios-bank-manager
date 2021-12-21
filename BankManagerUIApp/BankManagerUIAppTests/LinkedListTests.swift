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
    
    func test_빈값에_remove_메서드() {
        let result = sut.remove()
        
        XCTAssertNil(result)
    }
    
    func test_append_와_remove_메서드() {
        sut.append(1)
        
        let result = sut.remove()

        XCTAssertEqual(result, 1)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_와_remove_두번씩_실행() {
        sut.append(1)
        sut.append(2)

        XCTAssertEqual(sut.remove(), 1)
        XCTAssertFalse(sut.isEmpty)
        
        XCTAssertEqual(sut.remove(), 2)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_후에_peek_메서드() {
        // given
        let item = 6
        
        // when
        sut.append(item)
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, item)
    }
    
    func test_비어있는_LinkedList에서_peek_메서드() {
        // then
        XCTAssertNil(sut.peek())
    }
}
