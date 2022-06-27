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

    func test_linkedList_append가_잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        let result = sut.peek()
        // then
        XCTAssertEqual(result, 1)
    }

    func test_linkedList_removeAll이_잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        sut.removeAll()
        let result = sut.peek()
        // then
        XCTAssertEqual(result, nil)
    }

    func test_linkedList_remove가_잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        let result = sut.remove()
        // then
        XCTAssertEqual(result, 1)
    }

    func test_linkedList_remove가_잘되는지2() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        _ = sut.remove()
        _ = sut.remove()
        let result = sut.remove()
        // then
        XCTAssertEqual(result, 3)
    }

    func test_linkedList_isEmpty가_정상적으로_false를_반환하는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertEqual(result, false)
    }

    func test_linkedList_isEmpty가_정상적으로_true를_반환하는지() {
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertEqual(result, true)
    }
}
