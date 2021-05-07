//
//  CustomerMakerTest.swift
//  BankManagerTest
//
//  Created by 이영우 on 2021/05/07.
//

import XCTest

class CustomerMakerTest: XCTestCase {

  var customerMaker: CustomerMaker!
    override func setUpWithError() throws {
      customerMaker = CustomerMaker()
    }

    override func tearDownWithError() throws {
      customerMaker = nil
    }

  func test_randomCustomer_number일치_확인() {
    do {
      let result = try customerMaker.randomCustomer(number: 3)
      XCTAssertEqual(result.showCustomerProperty().0, 3)
    } catch {
      XCTFail()
    }
  }
  
  func test_randomCustomer_grade포함_확인() {
    do {
      let result = try customerMaker.randomCustomer(number: 3)
      let grade = result.showCustomerProperty().1

      print(grade)
      XCTAssertTrue(CustomerGrade.allCases.contains(grade))
    } catch {
      XCTFail()
    }
  }
  
  func test_randomCustomer_task포함_확인() {
    do {
      let result = try customerMaker.randomCustomer(number: 3)
      let task = result.showCustomerProperty().2
      
      print(task)
      XCTAssertTrue(TaskType.allCases.contains(task))
    } catch {
      XCTFail()
    }
  }
}
