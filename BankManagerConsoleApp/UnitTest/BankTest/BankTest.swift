//
//  BankTest.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

final class BankTest: XCTestCase {
    
    var sut: Bank!
    
    override func setUpWithError() throws {
       sut = Bank(loanBankerCount: 1, depositBankerCount: 1)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_open_실행시_totalCustomer만큼_enqueue가_진행된다() {
        let testValue = 20
        sut.open(totalCustomer: <#T##Int#>)
    }

 

}
