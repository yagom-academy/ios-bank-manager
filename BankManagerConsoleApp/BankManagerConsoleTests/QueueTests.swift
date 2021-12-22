import XCTest

class QueueTests: XCTestCase {
    var queue: Queue<Int>!

    override func setUpWithError() throws {
        queue = Queue<Int>()
    }

    func test_Should_isEmptyIsFalse_When_enqueue3() {
        queue.enqueue(3)
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_Should_returnValueIs1_When_dequeue() {
        queue.enqueue(1)
        let returnValue = queue.dequeue()
        XCTAssertEqual(returnValue, 1)
    }
    
    func test_Should_returnValueIs1_When_peek() {
        queue.enqueue(1)
        let returnValue = queue.peek()
        XCTAssertEqual(returnValue, 1)
    }
    
    func test_Should_isEmptyIsTrue_When_clear() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        queue.clear()
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_Should() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        queue.insert(5, at: 0)
    
        while !queue.isEmpty {
            print(queue.dequeue())
        }
    }
}
