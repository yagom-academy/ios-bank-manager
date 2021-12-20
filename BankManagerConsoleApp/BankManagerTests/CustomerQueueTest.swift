import XCTest


class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue시_element가_정상적으로_들어가는지() {
        sut.enqueue(1)
        
        let dequeueResult = sut.dequeue()
        
        XCTAssertEqual(1, dequeueResult)
    }
    
    func test_dequeue시_element가_정상적으로_반환되는지() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let firstDequeueResult = sut.dequeue()
        let secondDequeueResult = sut.dequeue()
        
        XCTAssertEqual(1, firstDequeueResult)
        XCTAssertEqual(2, secondDequeueResult)
    }
    
    func test_clear시_queue가_정상적으로_비워지는지() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        sut.clear()
        
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }

    func test_queue가_비었을때_isEmpty가_true를_반환하는지() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_queue가_안비었을때_isEmpty가_false를_반환하는지() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let result = sut.isEmpty
        
        XCTAssertFalse(result)
    }
}
