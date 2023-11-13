import XCTest
@testable import BankManager

final class LinkedListTests: XCTestCase {
    var sut = LinkedList<Int>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_count_노드가없을때0이다() {
        // given
        sut = LinkedList()
        let expectation = 0
        
        // when
        let result = sut.count()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
