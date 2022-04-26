//
//  BankQueueTests.swift
//  BankManagerConsoleAppTest
//
//  Created by Lingo, Cathy on 2022/04/26.
//

import XCTest

final class BankQueueTests: XCTestCase {
  private var sut: BankQueue<Int>?

  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = BankQueue<Int>()
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }

  func testIsEmpty_WhenQueueIsEmpty_ShouldReturnTrue() {
    // given when
    let output = self.sut?.isEmpty
    // then
    XCTAssertEqual(output, true)
  }

  func testIsEmpty_WhenQueueIsNotEmpty_ShouldReturnFalse() {
    // given
    self.sut?.enqueue(1)
    // when
    let output = self.sut?.isEmpty
    // then
    XCTAssertEqual(output, false)
  }

  func testPeek_WhenQueueIsEmpty_ShouldReturnNil() {
    // given when
    let output = self.sut?.peek
    // then
    XCTAssertEqual(output, nil)
  }

  func testPeek_WhenQueueEnqueueOne_ShouldReturnOne() {
    // given
    self.sut?.enqueue(1)
    // when
    let output = self.sut?.peek
    // then
    XCTAssertEqual(output, 1)
  }

  func testPeek_WhenQueueEnqueueOneTwo_ShouldReturnOne() {
    // given
    self.sut?.enqueue(1)
    self.sut?.enqueue(2)
    // when
    let output = self.sut?.peek
    // then
    XCTAssertEqual(output, 1)
  }

  func testEnqueue_WhenQueueIsEmpty_IsEmptyShouldReturnFalse() {
    // given when
    self.sut?.enqueue(1)
    let output = self.sut?.isEmpty
    // then
    XCTAssertEqual(output, false)
  }

  func testDequeue_WhenQueueIsEmpty_ShouldReturnNil() {
    // given when
    let output = self.sut?.dequeue()
    // then
    XCTAssertEqual(output, nil)
  }

  func testDequeue_WhenQueueIsNotEmpty_ShouldReturnFirstElement() {
    // given
    self.sut?.enqueue(1)
    // when
    let input = self.sut?.peek
    let output = self.sut?.dequeue()
    // then
    XCTAssertEqual(output, input)
  }

  func testClear_WhenQueueIsNotEmpty_IsEmptyShouldReturnTrue() {
    // given
    self.sut?.enqueue(1)
    // when
    self.sut?.clear()
    let output = self.sut?.isEmpty
    // then
    XCTAssertEqual(output, true)
  }
}
