//
//  QueueTests.swift
//  
//
//  Created by Diana, Hamzzi on 3/19/24.
//

import XCTest
@testable import BankManager

final class QueueTests: XCTestCase {
    private var sut: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_큐가_비어있는지_확인할_수_있다() {
        XCTAssertTrue(sut.isEmpty, "시작 시 큐는 비어 있어야 합니다.")
    }
    
    func test_큐에_값을_삽입할_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        XCTAssertFalse(sut.isEmpty, "큐가 비어 있지 않아야 합니다.")
        XCTAssertEqual(sut.count, 3, "큐에는 3개의 element가 존재해야 합니다.")
    }
    
    func test_큐에서_값을_삭제할_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let dequeuedItem1 = sut.dequeue()
        XCTAssertEqual(dequeuedItem1, 1, "dequeue된 element는 1이어야 합니다.")
        
        let dequeuedItem2 = sut.dequeue()
        XCTAssertEqual(dequeuedItem2, 2, "dequeue된 element는 2이어야 합니다.")
    }

}
