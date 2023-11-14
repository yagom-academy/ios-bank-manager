import XCTest
@testable import BankManager

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_count_노드가없을때0이다() {
        // given
        let expectation = 0
        
        // when
        let result = sut.count()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_LinkedList에_데이터1을넣었을때_showFirstNode의결과값과_1과동일하다() {
        sut.append(data: 1)
        
        let result = sut.showFirstNode()
        
        XCTAssertEqual(result, 1)
    }
    
    func test_LinkedList에_데이터1_2_3을_넣었을때_head데이터가_1이고_tail데이터가_3이다() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        let headResult = sut.head?.data
        let tailResult = sut.tail?.data
        
        XCTAssertEqual(headResult, 1)
        XCTAssertEqual(tailResult, 3)
    }
    
    func test_LinkedList에_데이터_1_2를_넣었을때_removeFirst시_removeData로_1이나오고_head의_데이터는_2가된다() {
        sut.append(data: 1)
        sut.append(data: 2)
        
        let removeData = sut.removeFirst()
        let result = sut.head?.data
        
        XCTAssertEqual(removeData, 1)
        XCTAssertEqual(result, 2)
    }
    
    func test_LinkedList에_데이터_1_2_3을_넣었을때_removeAll시_head의데이터와_tail의데이터가_nil이된다() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.head?.data, nil)
        XCTAssertEqual(sut.tail?.data, nil)
    }
    
}
