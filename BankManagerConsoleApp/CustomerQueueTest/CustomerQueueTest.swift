import XCTest

class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        //sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue가_잘되는지() {
        // given
        sut.enqueue(data: 1)
        // when
        let result = sut.peek
        // then
        //XCTAssertEqual(result, 1)
    }

    func test_dequeue가_잘되는지() {
        // given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        // when
        //_ = sut.dequeue()
        //let result = sut.dequeue()
        // then
        //XCTAssertEqual(result, 2)
    }

    func test_dequeue가_잘되는지1() {
        // when
        //let result = sut.dequeue()
        // then
        //XCTAssertEqual(result, nil)
    }

    func test_clear가_잘되는지() {
        // given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        // when
        sut.clear()
        // then
        let result: Int? = nil
        XCTAssertEqual(result, nil)
    }

    func test_isEmpty가_잘되는지() {
        // given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        // when
        sut.clear()
        // then
        let result = sut.isEmpty
        XCTAssertEqual(result, true)
    }
}
