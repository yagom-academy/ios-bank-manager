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
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ value: Element) {
        let newNode = Node(value: value)
        
        if head == nil {
            head = newNode
        } else {
            head?.next = newNode
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
}
