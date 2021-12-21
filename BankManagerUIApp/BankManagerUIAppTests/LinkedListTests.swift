import XCTest
@testable import BankManagerUIApp

class LinkedListTests: XCTestCase {

    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList<Int>.init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_빈값에_remove_메서드() {
        let result = sut.remove()
        
        XCTAssertNil(result)
    }
    
    func test_append_와_remove_메서드() {
        sut.append(1)
        
        let result = sut.remove()

        XCTAssertEqual(result, 1)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_append_와_remove_두번씩_실행() {
        sut.append(1)
        sut.append(2)

        XCTAssertEqual(sut.remove(), 1)
        XCTAssertFalse(sut.isEmpty)
        
        XCTAssertEqual(sut.remove(), 2)
        XCTAssertTrue(sut.isEmpty)
    }
}
