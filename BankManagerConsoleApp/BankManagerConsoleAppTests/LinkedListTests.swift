import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_LinkedList_append_한개의요소를_넣었을_때_isEmpty가_false인가() {
        sut.append(1)
                
        XCTAssertFalse(sut.isEmpty)
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
        XCTAssertEqual(sut.first, 2)
    }
    
    func test_LinkedList_append_3개() {
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        let result1 = sut.removeFirst()
        let result2 = sut.removeFirst()
        let result3 = sut.removeFirst()
        
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
        XCTAssertEqual(result3, 3)
    }
    
    func test_LinkedList_removeAll() {
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_LinkedList_첫번째요소가_잘나오는지_확인() {
        sut.append(1)
        sut.append(2)
        
        let result = sut.first
        
        XCTAssertEqual(result, 1)
    }
}
