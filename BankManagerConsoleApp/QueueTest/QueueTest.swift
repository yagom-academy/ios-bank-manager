import XCTest

class QueueTest: XCTestCase {
    var queue: CustomerQueue<Int>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        queue = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        queue = nil
    }
    
    func test_queue에_enqueue를3번했을때_count가_3이어야한다() {
        // given
        queue?.enqueue(element: 1)
        queue?.enqueue(element: 2)
        queue?.enqueue(element: 3)
        
        // when
        let count = queue?.count
        
        // then
        XCTAssertEqual(count, 3)
    }
    
    func test_queue에_dequeue를2번했을때_2를리턴하고_count가1이어야한다() {
        // given
        queue?.enqueue(element: 1)
        queue?.enqueue(element: 2)
        queue?.enqueue(element: 3)
        _ = queue?.dequeue()
        
        // when
        let value = queue?.dequeue()
        let count = queue?.count
        
        // then
        XCTAssertEqual(value, 2)
        XCTAssertEqual(count, 1)
    }
    
    func test_queue를_clear하면_count가0이어야한다() {
        // given
        queue?.enqueue(element: 1)
        queue?.enqueue(element: 2)
        queue?.enqueue(element: 3)
        
        // when
        queue?.clear()
        let result = queue?.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_queue의head가1일때_peek했을때_1을리턴해야한다() {
        // given
        queue?.enqueue(element: 1)
        
        // when
        let value = queue?.peek()
        let count = queue?.count
        
        // then
        XCTAssertEqual(value, 1)
        XCTAssertEqual(count, 1)
    }
}
