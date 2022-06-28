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
        let result = sut.peek
        // then
        XCTAssertEqual(result, 1)
    }

    func test_linkedList_removeAll이_잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        sut.removeAll()
        let result = sut.peek
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

    func test_linkedList_removeAt이_잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        let result = sut.removeAt(index: 1)
        // then
        XCTAssertEqual(result, 2)
    }

    func test_linkedList_removeAt이_잘되는지2() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        sut.append(data: 4)
        // when
        let result = sut.removeAt(index: 2)
        // then
        XCTAssertEqual(result, 3)
    }

    func test_linkedList_매개변수와_index가_같을_경우_removeAt이_잘되는지() {
        // given
        sut.append(data: 1)
        // when
        let result = sut.removeAt(index: 0)
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedList_비어있을경우_removeAt이_잘되는지() {
        // when
        let result = sut.removeAt(index: 0)
        // then
        XCTAssertEqual(result, nil)
    }

    func test_linkedList_isEmpty가_정상적으로_false를_반환하는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, false)
    }

    func test_linkedList_isEmpty가_정상적으로_true를_반환하는지() {
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, true)
    }

    func test_linkedList_insert가_처음에_잘_추가_되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        sut.append(data: 4)
        sut.append(data: 5)
        sut.insert(data: 9, index: 0)
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(result, 9)
    }

    func test_linkedList_insert가_중간에_잘_추가_되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        sut.append(data: 4)
        sut.append(data: 5)
        sut.insert(data: 9, index: 2)
        // when
        _ = sut.remove()
        _ = sut.remove()
        let result = sut.peek
        // then
        XCTAssertEqual(result, 9)
    }

    func test_linkedList_insert가_마지막에_잘_추가_되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        sut.append(data: 4)
        sut.append(data: 5)
        sut.insert(data: 9, index: 4)
        // when
        _ = sut.remove()
        _ = sut.remove()
        _ = sut.remove()
        _ = sut.remove()
        let result = sut.peek
        // then
        XCTAssertEqual(result, 9)
    }

    func test_linkedList가_비어있을때_insert가_잘_추가_되는지() {
        // given
        sut.insert(data: 1, index: 0)
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(result, 1)
    }

    func test_linkedList_serchNode가_잘되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)

        // when
        let result = sut.searchNode(index: 1)
        // then
        XCTAssertEqual(result?.data, 2)
    }
}
