//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by 이영우 on 2021/05/03.
//

import XCTest

class BankManagerTest: XCTestCase {
  var bankManager: BankManager!
  
    override func setUpWithError() throws {
      bankManager = BankManager()
    }

    override func tearDownWithError() throws {
      bankManager = nil
    }

  func test_Notification_확인() {
    let expectation = XCTestExpectation(description: "노티가 옴")
    
    NotificationCenter.default.addObserver(self, selector: #selector(success), name: NSNotification.Name(rawValue: "completedCustomer"), object: nil)
    
    let customers: [Int:Customer] = [1:Customer(order: 1)]
    bankManager.setBankCounters(number: 1)
    bankManager.process(customers, completionHandler: {
      expectation.fulfill()
    })
    wait(for: [expectation], timeout: 3)
  }
  
  @objc func success() {
    XCTAssert(true)
  }
  
  ///하이디의 피드백이 담긴 Test Function
  func test_Notification_확인2() {
    let expectation = XCTestExpectation(description: "노티가 온다")
    
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "completedCustomer"), object: nil, queue: nil, using: { _ in
      expectation.fulfill()
    })
    
    bankManager.setBankCounters(number: 1)
    bankManager.process([1:Customer(order: 1)])
    
    wait(for: [expectation], timeout: 1)
  }
}
