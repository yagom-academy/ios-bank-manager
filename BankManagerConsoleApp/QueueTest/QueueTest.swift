//
//  QueueTest.swift
//  QueueTest
//
//  Created by Eunsoo KIM on 2021/12/21.
//

import XCTest

class QueueTest: XCTestCase {
  func test_1을_enqueue했을_경우_head는_1인지() {
    // given
    var queue = Queue<Int>()
    
    // when
    queue.enqueue(1)
    
    // then
    XCTAssertEqual(1, queue.linkedList.head?.value)
  }
  
  func test_1이_있는_큐에_2를_enqueue하면_head는_1_tail은_2인지() {
    // given
    var queue = Queue<Int>()
    queue.enqueue(1)
    
    // when
    queue.enqueue(2)
    
    //// then
    XCTAssertEqual(1, queue.linkedList.head?.value)
    XCTAssertEqual(2, queue.linkedList.tail?.value)
  }
  
  func test_1만_존재하는_큐에서_dequeue하면_head값이_반환되는지() {
    // given
    var queue = Queue<Int>()
    queue.enqueue(1)
    
    // when, then
    XCTAssertEqual(1, queue.dequeue())
  }
  
  func test_1_2_3이_있는_큐에_dequeue_하면_head는_2_tail은_3인지() {
    // given
    var queue = Queue<Int>()
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    
    // when
    let _ = queue.dequeue()
    
    // then
    XCTAssertEqual(2, queue.linkedList.head?.value)
    XCTAssertEqual(3, queue.linkedList.tail?.value)
  }
  
  func test_비어있는_큐에_isEmpty를_실행하면_true가_반환되는지() {
    // given
    let queue = Queue<Int>()
    
    // when, then
    XCTAssertTrue(queue.isEmpty())
  }
  
  func test_1이_있는_큐에_isEmpty를_실행하면_false가_반환되는지() {
    // given
    var queue = Queue<Int>()
    queue.enqueue(1)
    
    // when, then
    XCTAssertFalse(queue.isEmpty())
  }
  
  func test_빈큐에_1_2를_enqueue하고_1_2를_dequeue하면_isEmpty가_true를_반환하는지() {
    // given
    var queue = Queue<Int>()
    
    // when
    queue.enqueue(1)
    queue.enqueue(2)
    let _ = queue.dequeue()
    let _ = queue.dequeue()
    
    // then
    XCTAssertTrue(queue.isEmpty())
  }
  
  func test_1_2가_있는_큐에_clear_하면_빈_큐가_되는지() {
    // given
    var queue = Queue<Int>()
    queue.enqueue(1)
    queue.enqueue(2)
    
    // when
    queue.clear()
    
    // then
    XCTAssertTrue(queue.isEmpty())
  }
  
  func test_1_2가_있는_큐에_peek_하면_1을_반환하는지() {
    // given
    var queue = Queue<Int>()
    queue.enqueue(1)
    queue.enqueue(2)
    
    // when, then
    XCTAssertEqual(1, queue.peek())
  }
}
