//
//  ConsoleViewControllerTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/04.
//

import XCTest

class ConsoleViewControllerTest: XCTestCase {
    var consoleViewControllerStubUserInput1: ConsoleViewController!
    var consoleViewControllerStubUserInput2: ConsoleViewController!
    var consoleViewControllerStubUserInputNot1Or2: ConsoleViewController!
    
    override func setUpWithError() throws {
        consoleViewControllerStubUserInput1 = ConsoleViewController(userInput: "1")
        
        consoleViewControllerStubUserInput2 = ConsoleViewController(userInput: "2")
        
        consoleViewControllerStubUserInputNot1Or2 = ConsoleViewController(userInput: "a")
    }

    override func tearDownWithError() throws {
        consoleViewControllerStubUserInput1 = nil
        consoleViewControllerStubUserInput2 = nil
        consoleViewControllerStubUserInputNot1Or2 = nil
    }
    
    func test_userInput이_1일때_shouldContinue의_반환값이_success_true인지() {
        let result = consoleViewControllerStubUserInput1.shouldContinue()
        XCTAssertEqual(result, .success(true))
    }
    
    func test_userInput이_2일때_shouldContinue의_반환값이_success_false인지() {
        let result = consoleViewControllerStubUserInput2.shouldContinue()
        XCTAssertEqual(result, .success(false))
    }
    
    func test_userInput이_1과_2가_아닐때_shouldContinue의_반환값이_failure이고_invalidUserInput_error을_반환하는지() {
        let result = consoleViewControllerStubUserInputNot1Or2.shouldContinue()
        XCTAssertEqual(result, .failure(.invalidUserInput))
    }
}
