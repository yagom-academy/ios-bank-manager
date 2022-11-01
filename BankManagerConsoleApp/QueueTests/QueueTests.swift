//
//  QueueTests.swift
//  QueueTests
//
//  Created by leewonseok on 2022/11/01.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Queue에_euqueue하고_dequeue했을때_같은_값이_나오는지() {
        let result = "ABCD"
        
        sut.enqueue(result)
        
        XCTAssertEqual(result, sut.dequeue())
    }
    
    func test_비어있는_Queue가_isEmpty가_맞는지() {
        XCTAssertEqual(true, sut.isEmpty)
    }
    
    
    func test_Queue에_5개의_값을_넣고_5개의_값을_뺐을때_isEmpty가_맞는지() {
        for _ in 1...5 {
            sut.enqueue("ABC")
        }
        
        for _ in 1...5 {
            let _ = sut.dequeue()
        }
        
        XCTAssertEqual(true, sut.isEmpty)
    }
}
