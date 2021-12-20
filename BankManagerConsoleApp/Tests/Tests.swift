import XCTest

@testable import BankManagerConsoleApp

class Tests: XCTestCase {

    func test_큐에_1과2를_enqueue하면_큐에는_1과2가_있다() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssertEqual(queue.array, [1,2])
    }
}
