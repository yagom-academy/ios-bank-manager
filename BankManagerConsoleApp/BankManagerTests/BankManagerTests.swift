//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Charlotte, Soll on 2021/07/28.
//

import XCTest

@testable import BankManagerConsoleApp

class BankManagerTests: XCTestCase {
    
    var sut: Queue<Int>?
    
    override func setUp() {
        super.setUp()
        sut = Queue<Int>()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_1을enqueue하면_queue에1이추가된다() throws {
        // given
        let guess: Int = 1
        
        // when
        sut?.enqueue(guess)
        
        // then
        XCTAssertEqual(sut?.peek(), 1)
    }
    
    func test_1이있는queue를dequeue하면_queue가nil이다() throws {
        // given
        sut?.enqueue(1)
        
        // when
        sut?.dequeue()
        
        // then
        XCTAssertEqual(sut?.peek(), nil)
    }
    
    func test_1과2가있는queue를dequeue하면_반환값이1이다() throws {
        // given
        sut?.enqueue(1)
        sut?.enqueue(2)
        
        // when
        let guess = sut?.dequeue()
        
        // then
        XCTAssertEqual(guess, 1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
