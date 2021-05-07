//
//  BankTaskTest.swift
//  BankManagerTest
//
//  Created by 이영우 on 2021/05/07.
//

import XCTest

class BankTaskTest: XCTestCase {
  var bankDepositTask: BankTask!
  var bankLoanTask: BankTask!
  
  override func setUpWithError() throws {
    bankDepositTask = BankTask(number: 1, grade: .vvip, type: .deposit)
    bankLoanTask = BankTask(number: 2, grade: .vip, type: .loan)
  }
  
  override func tearDownWithError() throws {
    bankDepositTask = nil
    bankLoanTask = nil
  }
  
  ///예금작업시 0.7초 소요
  ///- timeout: 0.7초시 testFail발생
  func test_Deposit비동기_시간경과_테스트() {
    let expectation = XCTestExpectation(description: "예금 완료")
    bankDepositTask.completionBlock = {
      expectation.fulfill()
    }
    OperationQueue().addOperation(bankDepositTask)
    
    //예금작업 0.7초 소요
    wait(for: [expectation], timeout: 0.71)
  }
  
  ///대출작업시 1.1초 소요
  ///- timeout: 1.1초시 testFail발생
  func test_Loan비동기_시간경과_테스트() {
    let expectation = XCTestExpectation(description: "대출 완료")
    bankLoanTask.completionBlock = {
      expectation.fulfill()
    }
    OperationQueue().addOperation(bankLoanTask)
    
    wait(for: [expectation], timeout: 1.2)
  }
}
