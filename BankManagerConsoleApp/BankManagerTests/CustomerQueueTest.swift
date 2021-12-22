import XCTest

class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue<Int> = CustomerQueue<Int>()

    override func setUpWithError() throws {
        sut = CustomerQueue<Int>()
    }

    func test_빈_큐에_1을_enqueue하면_1이_남는다() {
        sut.enqueue(value: 1)
        XCTAssertEqual(sut.customers.head?.value, 1)
        XCTAssertNil(sut.customers.head?.next)
    }
    
    func test_빈_큐에_1과2를_enqueue하면_1과2가_남는다() {
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        XCTAssertEqual(sut.customers.head?.value, 1)
        XCTAssertEqual(sut.customers.head?.next?.value, 2)
        XCTAssertNil(sut.customers.head?.next?.next)
    }
    
    func test_빈_큐를_dequeue하면_nil이_반환된다() {
        XCTAssertNil(try sut.dequeue())
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_1이_있는_큐를_dequeue하면_빈큐가되고_1을_반환된다() {
        sut.enqueue(value: 1)
        XCTAssertEqual(try sut.dequeue(), 1)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_1과2가_들어간_큐를_clear하면_빈큐가_된다() {
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.clear()
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_1을_넣은_큐에_peek을_하면_1을_반환하고_1은_남아있다() {
        sut.enqueue(value: 1)
        let peekedNumber = sut.peek
        XCTAssertEqual(peekedNumber, 1)
        XCTAssertEqual(sut.customers.head?.value, 1)
    }
    
    func test_빈_큐에_0을_index0에_insert하면_0이_남는다() {
        XCTAssertNoThrow(try sut.customers.insert(0, at: 0))
        XCTAssertEqual(sut.customers.head?.value, 0)
    }
    
    func test_빈_큐에_0을_index1에_insert하면_에러가_발생한다() {
        XCTAssertThrowsError(try sut.customers.insert(0, at: 1))
    }

    func test_0이_있는_큐에_1을_index0에_insert하면_1과0이_남는다() {
        sut.enqueue(value: 0)
        XCTAssertNoThrow(try sut.customers.insert(1, at: 0))
        XCTAssertEqual(sut.customers.head?.value, 1)
        XCTAssertEqual(sut.customers.head?.next?.value, 0)
    }

    func test_0이_있는_큐에_1을_index1에_insert하면_0과1이_남는다() {
        sut.enqueue(value: 0)
        XCTAssertEqual(sut.customers.head?.value, 0)
        XCTAssertNoThrow(try sut.customers.insert(1, at: 1))
        XCTAssertEqual(try sut.customers.head?.value, 0)
        XCTAssertEqual(try sut.customers.head?.next?.value, 1)
    }

    func test_0과1과2가_있는_큐에_3을_index2에_insert하면_0과1과3과2가_남는다() {
        sut.enqueue(value: 0)
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        XCTAssertNoThrow(try sut.customers.insert(3, at: 2))
        XCTAssertEqual(sut.customers.head?.value, 0)
        XCTAssertEqual(sut.customers.head?.next?.value, 1)
        XCTAssertEqual(sut.customers.head?.next?.next?.value, 3)
        XCTAssertEqual(sut.customers.head?.next?.next?.next?.value, 2)
    }
    
    func test_빈_큐에_index0을_remove하면_nil을_반환한다() {
        XCTAssertNil(try sut.customers.remove(at: 0))
    }
    
    func test_빈_큐에_index1을_remove하면_에러가_발생한다() {
        XCTAssertThrowsError(try sut.customers.remove(at: 1))
    }
    
    func test_0이_있는_큐에_index0을_remove하면_빈_큐가_된다() {
        sut.enqueue(value: 0)
        XCTAssertNoThrow(try sut.customers.remove(at: 0))
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_0이_있는_큐에_index1을_remove하면_에러가_발생한다() {
        sut.enqueue(value: 0)
        XCTAssertThrowsError(try sut.customers.remove(at: 1))
    }

    func test_0과1이_있는_큐에_index1을_remove하면_1을_반환하고_0이_남는다() {
        sut.enqueue(value: 0)
        sut.enqueue(value: 1)
        XCTAssertEqual(try sut.customers.remove(at: 1), 1)
        XCTAssertEqual(try sut.customers.head?.value, 0)
        XCTAssertNil(try sut.customers.head?.next)
    }
    
    func test_0과1과2가_있는_큐에_index0을_remove하면_0을_반환하고_1과2가_남는다() {
        sut.enqueue(value: 0)
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        XCTAssertEqual(try sut.customers.remove(at: 0), 0)
        XCTAssertEqual(try sut.customers.head?.value, 1)
        XCTAssertEqual(try sut.customers.head?.next?.value, 2)
        XCTAssertNil(try sut.customers.head?.next?.next)
    }

    func test_0과1과2가_있는_큐에_index1을_remove하면_1을_반환하고_0과2가_남는다() {
        sut.enqueue(value: 0)
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        XCTAssertEqual(try sut.customers.remove(at: 1), 1)
        XCTAssertEqual(try sut.customers.head?.value, 0)
        XCTAssertEqual(try sut.customers.head?.next?.value, 2)
        XCTAssertNil(try sut.customers.head?.next?.next)
    }
    
    func test_0과1과2가_있는_큐에_index2를_remove하면_2를_반환하고_0과1이_남는다() {
        sut.enqueue(value: 0)
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        XCTAssertEqual(try sut.customers.remove(at: 2), 2)
        XCTAssertEqual(try sut.customers.head?.value, 0)
        XCTAssertEqual(try sut.customers.head?.next?.value, 1)
        XCTAssertNil(try sut.customers.head?.next?.next)
    }
}
