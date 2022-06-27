import XCTest

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_linkedListappend가잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        let result = sut.peak()
        // then
        XCTAssertEqual(result, 1)
    }
}
