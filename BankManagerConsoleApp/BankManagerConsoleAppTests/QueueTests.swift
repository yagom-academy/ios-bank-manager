import XCTest

struct Queue<Element> {
    let items: LinkedList<Element>
    
    init(items: LinkedList<Element> = LinkedList<Element>()) {
        self.items = items
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var peek: Element? {
        return items.first
    }
    
    func enqueue(_ item: Element) {
        items.append(item)
    }
    
    @discardableResult
    func dequeue() -> Element? {
        return items.removeFirst()
    }
    
    func clear() {
        items.removeAll()
    }
}

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Queue_Enqueue가_잘_되는지() {
        sut.enqueue(1)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_Queue_peek() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        XCTAssertEqual(sut.peek, 1)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_Queue_Dequeue_한번() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 1)
        XCTAssertFalse(sut.isEmpty)
    }

    func test_Queue_Dequeue_두번() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_Queue_clear() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        sut.clear()

        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.peek)
    }
}
