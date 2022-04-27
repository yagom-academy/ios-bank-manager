import XCTest

class QueueTest: XCTestCase {
    var queue: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        queue = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        queue = nil
    }
    
    func test_queue에_enqueue를3번했을때_첫번째값이_1이어야한다() {
        // given
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        // when
        let value = queue.dequeue()
        
        // then
        XCTAssertEqual(value, 1)
    }
    
    func test_queue에_dequeue를2번했을때_2를리턴해야한다() {
        // given
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        _ = queue.dequeue()
        
        // when
        let value = queue.dequeue()
        
        // then
        XCTAssertEqual(value, 2)
    }
    
    func test_queue를_clear하면_isEmpty가true이어야한다() {
        // given
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        // when
        queue.clear()
        let result = queue.isEmpty
        
        // then
        XCTAssert(result)
    }
    
    func test_queue의head가1일때_peek했을때_1을리턴해야한다() {
        // given
        queue.enqueue(1)
        
        // when
        let value = queue.peek()
        
        // then
        XCTAssertEqual(value, 1)
    }
}
