import XCTest

final class LinkedList<Element> {
    final class Node<Element> {
        var value: Element
        var next: Node<Element>?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var first: Element? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ value: Element) {
        let newNode = Node(value: value)

        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }
        let result = head?.value
        head = head?.next
        
        return result
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_LinkedList_append_한개의요소() {
        sut.append(1)
        
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertNil(sut.head?.next)
    }
    
    func test_LinkedList_removeFirst() {
        sut.append(1)
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 1)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_LinkedList_append_두개의_요소_추가하고_removeFirst() {
        sut.append(1)
        sut.append(2)
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 1)
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.head?.value, 2)
    }
    
    func test_LinkedList_append_3개() {
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.tail?.value, 3)
    }
    
    func test_LinkedList_연결이_잘되어있는지_확인() {
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)

        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.head?.next?.value, 2)
        XCTAssertEqual(sut.head?.next?.next?.value, 3)
        XCTAssertEqual(sut.head?.next?.next?.next?.value, 4)
        XCTAssertEqual(sut.tail?.value, 4)
    }
    
    func test_LinkedList_removeAll() {
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_LinkedList_첫번째요소가_잘나오는지_확인() {
        sut.append(1)
        sut.append(2)
        
        let result = sut.first
        
        XCTAssertEqual(result, 1)
    }
}
