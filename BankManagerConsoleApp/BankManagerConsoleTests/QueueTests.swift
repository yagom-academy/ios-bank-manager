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
    
    func test_Should_retrunValueIs1_When_removeFirstElement() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        let returnValue = queue.remove(at: 0)
        XCTAssertEqual(returnValue, 1)
    }
    
    func test_Should_retrunValueIs4_When_removeLastElement() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        let returnValue = queue.remove(at: 3)
        XCTAssertEqual(returnValue, 4)
    }
    
    func test_Should_retrunValueIs3_When_removeIntermediateElement() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        let returnValue = queue.remove(at: 2)
        XCTAssertEqual(returnValue, 3)
    }
    
    func test_Should_returnValueIsStringA_When_dequeue() {
        var queue: Queue<String> = Queue<String>()
        queue.enqueue("A")
        XCTAssertEqual(queue.dequeue(), "A")
    }
    
    func test_Should_returnValueIsDoubleZero_When_dequeue() {
        var queue: Queue<Double> = Queue<Double>()
        queue.enqueue(0.0)
        XCTAssertEqual(queue.dequeue(), .zero)
    }
    
    func test_Should_returnElementAtFirst_When_removeAtFirstAfterinsertAtFirst() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.insert(5, at: 0)
        XCTAssertEqual(queue.remove(at: 0), 5)
    }
    
    func test_Should_returnElementAtLast_When_removeAtLastAfterinsertAtLast() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.insert(5, at: 3)
        XCTAssertEqual(queue.remove(at: 3), 5)
    }
    
    func test_Should_returnElementAt1_When_removeAt1AfterinsertAt1() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.insert(5, at: 1)
        XCTAssertEqual(queue.remove(at: 1), 5)
    }
}
