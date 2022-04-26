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
    //given when
    let output = self.sut?.isEmpty
    //then
    XCTAssertEqual(output, true)
  }
  
  func testIsEmpty_WhenQueueIsNotEmpty_ShouldReturnFalse() {
    //given
    self.sut?.enqueue(1)
    //when
    let output = self.sut?.isEmpty
    //then
    XCTAssertEqual(output, false)
  }
}
