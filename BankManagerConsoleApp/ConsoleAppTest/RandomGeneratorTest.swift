//
//  RandomGeneratorTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/03.
//

import XCTest

class RandomGeneratorTest: XCTestCase {
    var dummyRandomGenerator: RandomGenerator?
    override func setUpWithError() throws {
        dummyRandomGenerator = RandomGenerator()
    }

    override func tearDownWithError() throws {
        dummyRandomGenerator = nil
    }

    func test_generateRandomCustomer가_RandomRange만큼의_Customer을_반환하는지() {
        guard let randomGenerator = dummyRandomGenerator else {
            XCTFail("dummyRandomGenrator is nil")
            return
        }
        for _ in 1...1000 {
            DispatchQueue.global().async {
                let randomCustomer = randomGenerator.generateRandomCustomer()
                XCTAssertTrue(randomCustomer.count <= 30 && randomCustomer.count >= 10)
            }
        }
    }
}
