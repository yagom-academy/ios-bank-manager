import XCTest

//@testable import BankManagerConsoleApp

class Tests: XCTestCase {

    func test_큐에_1과2를_enqueue하면_큐에는_1과2가_있다() {
        var queue = Queue<Int>()
        var result: [Int?] = []
        queue.enqueue(1)
        queue.enqueue(2)
        result.append(queue.dequeue())
        result.append(queue.dequeue())
        
        XCTAssertEqual(result, [1,2])
    }
    
    func test_큐에_1을_enqueue후_dequeue하면_큐가_비어있는지() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        _ = queue.dequeue()
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_큐에_1과2_enqueue후_clear하면_큐가_비어있는지() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.clear()
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_큐에_값이_있을때_isEmpty가_false인지() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_1과2를_enqueue후_peek을_하면_1이_반환된다() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)

        XCTAssertEqual(queue.peek(), 1)
    }
}
