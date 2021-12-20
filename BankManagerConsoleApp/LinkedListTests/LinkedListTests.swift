import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_linkedList에_head가_없을때_append가_정상적으로되는지() {
        sut.append(1)
        
        let result = sut.head?.data
        
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedList에_head가_있을때_append가_정상적으로되는지() {
        sut.append(1)
        sut.append(2)
        
        let headResult = sut.head?.data
        let headNextResult = sut.head?.next?.data
        
        XCTAssertEqual(headResult, 1)
        XCTAssertEqual(headNextResult, 2)
    }
    
    func test_linkedList에_head가_없을때_removeLast가_nil을반환하는지() {
        let result = sut.removeLast()
        
        XCTAssertNil(result)
    }
    
    func test_linkedList에_head가_있을때_removeLast가_정상적으로되는지() {
        sut.append(1)
        sut.append(2)
        
        let firstResult = sut.removeLast()
        let secondResult = sut.removeLast()
        let thirdResult = sut.removeLast()
        
        XCTAssertEqual(firstResult, 2)
        XCTAssertEqual(secondResult, 1)
        XCTAssertNil(thirdResult)
    }
}
