//
//  RandomGeneratorTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/03.
//

import XCTest

class RandomGeneratorTest: XCTestCase {
    var sut: RandomGenerator!
    
    override func setUpWithError() throws {
        sut = RandomGenerator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_generateRandomCustomer_호출시_totalCustomer가_10이상_30이하로_setting_되는지_1000회_test() {
        for _ in 1...1000 {
//            DispatchQueue.global().async {
                self.sut.generateRandomCustomer()
                XCTAssertTrue(10 <= self.sut.totalCustomer && self.sut.totalCustomer <= 30)
//            }
        }
    }
}
