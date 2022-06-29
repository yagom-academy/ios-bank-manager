import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isEmpty_아무것도넣지않으면_isEmpty가true인지() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_enqueue_6을넣으면_peek이6이나오는지() {
        // given
        let input: Double = 6
        let expectation: Double = 6
        
        // when
        sut.enqueue(input)
        let result = try! sut.peek()
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue_7이들어있을때_dequeue하면7이나오는지() {
        // given
        let input: Double = 7
        let expectation: Double = 7
        
        // when
        sut.enqueue(input)
        let result = try! sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_clear_여러값이들어있을때clear하면_isEmpty가true인지() {
        // given
        let input: [Double] = [5, 7, 10]
        
        // when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        sut.enqueue(input[2])
        sut.clear()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_enqueue와dequeue를반복하면_순서에맞는값이나오는지() {
        // given
        let input: [Double] = [5, 7, 10]
        let expectation: Double = 7
        
        // when
        sut.enqueue(input[0])
        _ = try! sut.dequeue()
        sut.enqueue(input[1])
        sut.enqueue(input[2])
        let result = try! sut.peek()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek_값이없을때peek하면_에러를던지는지() {
        // then
        XCTAssertThrowsError(try sut.peek())
    }
    
    func test_dequeue_값이없을때dequeue하면_에러를던지는지() {
        // then
        XCTAssertThrowsError(try sut.dequeue())
    }
}
