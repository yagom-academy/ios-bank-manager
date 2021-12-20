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

}
