//
//  QueueTest.swift
//  QueueTest
//
//  Created by Eunsoo KIM on 2021/12/21.
//

import XCTest

class QueueTest: XCTestCase {
    func test_1을_enqueue했을_경우_head는_1인지() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        
        guard let head = queue.peek() else {
            return
        }
        
        XCTAssertEqual(1, head)
    }

}
