import XCTest

class LinkedListTests: XCTestCase {
    var sut: MockLinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = MockLinkedList()
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
