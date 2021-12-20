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
}
