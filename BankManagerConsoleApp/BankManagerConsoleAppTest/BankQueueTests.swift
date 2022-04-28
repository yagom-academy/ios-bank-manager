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
    guard let output = self.sut?.isEmpty else { return XCTFail() }
    // then
    XCTAssertTrue(output)
  }

  func testIsEmpty_WhenQueueIsNotEmpty_ShouldReturnFalse() {
    // given
    let value = 1
    self.sut?.enqueue(value)
    // when
    guard let output = self.sut?.isEmpty else { return XCTFail() }
    // then
    XCTAssertFalse(output)
  }

  func testPeek_WhenQueueIsEmpty_ShouldReturnNil() {
    // given when
    let output = self.sut?.peek
    // then
    XCTAssertNil(output)
  }

  func testPeek_WhenQueueEnqueueOne_ShouldReturnOne() {
    // given
    let value = 1
    self.sut?.enqueue(value)
    // when
    let output = self.sut?.peek
    // then
    XCTAssertEqual(output, value)
  }

  func testPeek_WhenQueueEnqueueOneTwo_ShouldReturnOne() {
    // given
    let firstValue = 1
    let secondValue = 2
    self.sut?.enqueue(firstValue)
    self.sut?.enqueue(secondValue)
    // when
    let output = self.sut?.peek
    // then
    XCTAssertEqual(output, firstValue)
  }

  func testEnqueue_WhenQueueIsEmpty_IsEmptyShouldReturnFalse() {
    // given when
    let value = 1
    self.sut?.enqueue(value)
    guard let output = self.sut?.isEmpty else { return XCTFail() }
    // then
    XCTAssertFalse(output)
  }

  func testDequeue_WhenQueueIsEmpty_ShouldReturnNil() {
    // given when
    let output = self.sut?.dequeue()
    // then
    XCTAssertNil(output)
  }

  func testDequeue_WhenQueueIsNotEmpty_ShouldReturnFirstElement() {
    // given
    let value = 1
    self.sut?.enqueue(value)
    // when
    let input = self.sut?.peek
    let output = self.sut?.dequeue()
    // then
    XCTAssertEqual(output, input)
  }

  func testDequeue_WhenQueueIsNotEmpty_ShouldReturnSecondElement() {
    // given
    let firstValue = 1
    let secondValue = 2
    self.sut?.enqueue(firstValue)
    self.sut?.enqueue(secondValue)
    // when
    var output = self.sut?.dequeue()
    output = self.sut?.dequeue()
    // then
    XCTAssertEqual(output, secondValue)
  }

  func testClear_WhenQueueIsNotEmpty_IsEmptyShouldReturnTrue() {
    // given
    let value = 1
    self.sut?.enqueue(value)
    // when
    self.sut?.clear()
    guard let output = self.sut?.isEmpty else { return XCTFail() }
    // then
    XCTAssertTrue(output)
  }
}
