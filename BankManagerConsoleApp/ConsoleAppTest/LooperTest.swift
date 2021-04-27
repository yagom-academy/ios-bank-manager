//
//  LooperTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/28.
//

import XCTest

class LooperTest: XCTestCase {
    struct DummyLooper: Looper {}
    var dummyLooper = DummyLooper()
    
    func test_Looper_shouldContinue_when_userInput_is_1() {
        let userInput = dummyLooper.shouldContinue(userInput: "1")
        XCTAssertEqual(userInput, true)
    }
    
    func test_Looper_shouldContinue_when_userInput_is_2() {
        let userInput = dummyLooper.shouldContinue(userInput: "2")
        XCTAssertEqual(userInput, false)
    }
}
