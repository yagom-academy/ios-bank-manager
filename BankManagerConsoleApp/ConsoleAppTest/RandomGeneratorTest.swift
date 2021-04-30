//
//  RandomGeneratorTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/29.
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
    
    func test_createRandomNumber() {
        for _ in 1...10000 {
            DispatchQueue.global().async {
                let randomNumberInRange = self.dummyRandomGenerator?.createRandomNumber()
                guard let random = randomNumberInRange else {
                    XCTFail()
                    return
                }
                XCTAssertTrue(10 <= random && random <= 30)
            }
        }
    }
}
