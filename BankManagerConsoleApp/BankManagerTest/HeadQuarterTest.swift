//
//  HeadQuarterTest.swift
//  BankManagerTest
//
//  Created by 이영우 on 2021/05/07.
//

import XCTest

class HeadQuarterTest: XCTestCase {
  var headQuarter: HeadQuarter!
  
  override func setUpWithError() throws {
    headQuarter = HeadQuarter.headQuarter
  }
  
  override func tearDownWithError() throws {
    headQuarter = nil
  }
  
  func test_본사_대출고객심사_비동기테스트() {
    let expectation = XCTestExpectation(description: "대출심사완료")
    OperationQueue().addOperation {
      self.headQuarter.processTask(number: 1, grade: .vip, completion: {
        expectation.fulfill()
      })
    }
    
    //대출심사과정은 0.5초 오차 포함 0.6초 wait
    wait(for: [expectation], timeout: 0.6)
  }
}

