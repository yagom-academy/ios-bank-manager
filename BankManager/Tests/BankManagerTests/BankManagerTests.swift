import XCTest
@testable import BankManager

final class BankManagerTests: XCTestCase {
    var sut: BankQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue하면_isEmpty가_false가뜨는가() throws {
        // when
        sut.enqueue(element: 4.0)
        let result = sut.isEmpty
        let expectation = false
        
        // then (테스트 결과를 보기위한)
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue하면_제대로된값이나오는가() throws {
        // given
        sut.enqueue(element: 4.0)
        
        // when
        let result = sut.dequeue()
        let expectation = 4.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    

    func test_dequeue하면_Queue가_첫번째요소를_반환하는가() throws {
        // given
        let dummys = [3.0, 4.0, 24.2]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }

        // when
        let result = sut.dequeue()
        let expectation = 3.0
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_Queue가_비어있을때_nil을_반환하는가() throws {
        // when
        let result = sut.dequeue()

        // then
        XCTAssertNil(result)
    }

    func test_clear를하면_Queue가_비워지는가() throws {
        // given
        let dummys = [3.0, 4.0, 24.2]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        sut.clear()
        let result = sut.isEmpty
        let expectation = true

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈배열에peek하면nil인지() {
        // given
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에isEmpty하면true인지() {
        // given
        
        // when
        let result = sut.isEmpty
        let expectation = true
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈배열에dequeue하면nil인지() {
        // given
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_enqueue했을때peek을정확히리턴하는지() {
        // given
        let dummys = [0.0, 1.0, 2.0, 3.0, 4.0]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        let result = sut.peek()
        let expectation = 0.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue했을때isEmpty하면false인지() {
        // given
        let dummys = [0.0, 1.0, 2.0, 3.0, 4.0]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        let result = sut.isEmpty
        let expectation = false
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    // 요소가 1개만 있을 때 dequeue
    func test_요소가1개만있을때_dequeue에_성공하는가() throws {
        // given
        sut.enqueue(element: 4.0)
        
        // when
        let result = sut.dequeue()
        let expectation = 4.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_요소가0개만있을때_dequeue에_성공하는가() throws {
        // given
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가2개있을때_dequeue에_성공하는가() throws {
        // given
        let dummys = [0.0, 1.0]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        let result = sut.dequeue()
        let expectation = Optional(0.0)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue1번했을때isEmpty확인() {
        // given
        let dummys = [0.0, 1.0, 2.0, 3.0, 4.0]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        sut.dequeue()
        let result = sut.isEmpty
        let expectation = false
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue1번했을때peek제대로반영되는지() {
        // given
        let dummys = [0.0, 1.0, 2.0, 3.0, 4.0]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        sut.dequeue()
        let result = sut.peek()
        let expectation = Optional(1.0)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue2번이상했을때맨앞요소를정확히리턴하는지() {
        // given
        let dummys = [0.0, 1.0, 2.0, 3.0, 4.0]
        for dummy in dummys {
            sut.enqueue(element: dummy)
        }
        
        // when
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        let result = sut.dequeue()
        let expectation = 3.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
