import XCTest

//@testable import BankManagerConsoleApp

class Tests: XCTestCase {

    func test_큐에_1과2를_enqueue하면_큐에는_1과2가_있다() {
        //given
        let queue = Queue<Int>()
        var result: [Int?] = []
        
        //when
        queue.enqueue(1)
        queue.enqueue(2)
        result.append(queue.dequeue())
        result.append(queue.dequeue())
        
        //then
        XCTAssertEqual(result, [1,2])
    }
    
    func test_큐에_1을_enqueue후_dequeue하면_큐가_비어있는지() {
        //given
        let queue = Queue<Int>()
        
        //when
        queue.enqueue(1)
        _ = queue.dequeue()
        
        //then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_큐에_1과2_enqueue후_clear하면_큐가_비어있는지() {
        //given
        let queue = Queue<Int>()
        
        //when
        queue.enqueue(1)
        queue.enqueue(2)
        queue.clear()
        
        //then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_큐에_값이_있을때_isEmpty가_false인지() {
        //given
        let queue = Queue<Int>()
        
        //when
        queue.enqueue(1)
        
        //then
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_1과2를_enqueue후_peek을_하면_1이_반환된다() {
        //given
        let queue = Queue<Int>()
        
        //when
        queue.enqueue(1)
        queue.enqueue(2)

        //then
        XCTAssertEqual(queue.peek(), 1)
    }
}

extension Tests {
    
    func test_큐에_1과2를_enqueue하고_dequeue를_두번하면_tail은_nil이다() {
        //given
        let queue = QueueTestDouble<Int>()
        
        //when
        queue.enqueue(1)
        queue.enqueue(2)
        _ = queue.dequeue()
        _ = queue.dequeue()
        
        //then
        XCTAssertNil(queue.tail)
    }
}

extension Tests {
    func test_allValues프로퍼티_테스트() {
        //given
        let queue = Queue<Int>()

        //when
        queue.enqueue(1)
        queue.enqueue(2)

        //then
        XCTAssertEqual(queue.allValues, [1,2])
    }
}
