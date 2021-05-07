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
      do {
        try bankManager = BankManager(numberOfBankers: 3)
      } catch {
        XCTFail("bankManager 생성 실패")
      }
    }

    override func tearDownWithError() throws {
      bankManager = nil
    }

}
