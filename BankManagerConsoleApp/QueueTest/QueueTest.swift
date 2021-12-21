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
    
    func test_1이_있는_큐에_2를_enqueue하면_head는_1_tail은_2인지() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssertEqual(1, queue.linkedList.head?.value)
        XCTAssertEqual(2, queue.linkedList.tail?.value)
    }
    
    func test_1만_존재하는_큐에서_dequeue하면_head값이_반환되는지() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        
        XCTAssertEqual(1, queue.dequeue())
    }

}
