//
//  RandomGeneratorTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/02.
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

    func test_createRandomNumberInRange() {
        DispatchQueue.main.async {
            for _ in 1...10000 {
                if let randomNumber = self.dummyRandomGenerator?.createRandomNumberInRange(10, to: 30){
                    XCTAssertTrue(randomNumber < 10 && randomNumber < 30)
                } else {
                    XCTFail("randomNumber is nil")
                    return
                }
            }
        }
    }
}
