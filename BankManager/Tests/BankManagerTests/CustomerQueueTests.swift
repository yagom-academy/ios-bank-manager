import XCTest
@testable import BankManager

final class MockLinkedList<T>: LinkedList<T> {
    private(set) var callMethod = false
    
    override var checkEmpty: Bool {
        callMethod = true
        return true
    }
    
    override var elementCount: Int {
        callMethod = true
        return 42
    }
    
    override var headValue: T? {
        callMethod = true
        return nil
    }
    
    override func addNode(value: T) {
        callMethod = true
    }
    
    override func removeNode() -> T? {
        callMethod = true
        return nil
    }
    
    override func removeAll() {
        callMethod = true
    }
}

final class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue(list: MockLinkedList<Int>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue가_list의addNode를_호출하는지_확인() throws {
        sut?.enqueue(value: 42)
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return
        }
        
        XCTAssertTrue(mockList.callMethod)
    }
    
    func test_dequeue가_list의removeNode를_호출하는지_확인() throws {
        sut?.dequeue()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return
        }
        
        XCTAssertTrue(mockList.callMethod)
    }
    
    func test_clear가_list의removeAll을_호출하는지_확인() throws {
        sut?.clear()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return
        }
        
        XCTAssertTrue(mockList.callMethod)
    }
    
    func test_peek가_list의headValue를_호출하는지_확인() throws {
        let _ = sut?.peek()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return
        }
        
        XCTAssertTrue(mockList.callMethod)
    }
    
    func test_isEmpty가_list의checkEmpty를_호출하는지_확인() throws {
        let _ = sut?.isEmpty()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return
        }
        
        XCTAssertTrue(mockList.callMethod)
    }
    
    func test_count가_list의elementCount를_호출하는지_확인() throws {
        let _ = sut?.count()
        
        guard let mockList = sut?.list as? MockLinkedList<Int> else {
            return
        }
        
        XCTAssertTrue(mockList.callMethod)
    }
}
