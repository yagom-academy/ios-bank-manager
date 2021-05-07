//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by 이영우 on 2021/05/03.
//

import XCTest

class BankManagerTest: XCTestCase {
  class bankManagerStub {
    let operationQueue: OperationQueue = OperationQueue()
    var customers: [Customer] = []
    
    init() {
      do {
        customers = try CustomerMaker().makeCustomer(count: 10)
      } catch {
        XCTFail("customers 생성 실패")
      }
      operationQueue.maxConcurrentOperationCount = 3
    }
    
    func inputCustomersIntoOperationQueue(completion: @escaping ()->Void) {
      operationQueue.addOperations(customers.map { $0.task }, waitUntilFinished: true)
      operationQueue.waitUntilAllOperationsAreFinished()
      completion()
    }
  }
  
  var bankManager: bankManagerStub!
  
  override func setUpWithError() throws {
    bankManager = bankManagerStub()
  }
  
  override func tearDownWithError() throws {
    bankManager = nil
  }
  
  ///10명 고객 최대 업무 걸리는 시간 11초
  ///대출 - 총 1.1초
  ///예금 - 총 0.7초
  func test_bankManager_Stub을_통한_inputCustomersIntoOperationQueue_메서드_테스트() {
    let expectation = XCTestExpectation(description: "Customers 업무 완료")
    bankManager.inputCustomersIntoOperationQueue(completion: {
      expectation.fulfill()
    })
    
    wait(for: [expectation], timeout: 12)
  }
}
