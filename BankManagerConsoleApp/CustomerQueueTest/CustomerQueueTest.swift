//
//  CustomerQueueTest.swift
//  CustomerQueueTest
//
//  Created by dhoney96 on 2022/06/28.
//

import XCTest

class CustomerQueueTest: XCTestCase {
    var sut: Queue<Int>!
    var firstData: Int!
    var secondData: Int!
    var thirdData: Int!
    var fourthData: Int!
    var lastData: Int!
    
    override func setUpWithError() throws {
        sut = Queue()
        firstData = 1
        secondData = 2
        thirdData = 3
        fourthData = 4
        lastData = 5
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_노드가_비어있는지_확인_비어있으면_true_반환() {
        XCTAssert(sut.isEmpty())
    }
    
    func test_노드가_비어있지않으면_false_반환() {
        sut.enqueue(inputData: firstData)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_enqueue된_순서대로_dequeue를_통해_반환() {
        sut.enqueue(inputData: firstData)
        sut.enqueue(inputData: secondData)
        sut.enqueue(inputData: thirdData)
        sut.enqueue(inputData: fourthData)
        sut.enqueue(inputData: lastData)
        
        var result = [Int?]()
        result.append(sut.dequeue())
        result.append(sut.dequeue())
        result.append(sut.dequeue())
        result.append(sut.dequeue())
        result.append(sut.dequeue())
        
        XCTAssertEqual([1, 2, 3, 4, 5], result)
    }
    
    func test_clear메서드_호출시_isEmpty가_true를_반환() {
        sut.enqueue(inputData: firstData)
        sut.enqueue(inputData: secondData)
        sut.enqueue(inputData: thirdData)
        sut.enqueue(inputData: fourthData)
        sut.enqueue(inputData: lastData)
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_노드가_하나일때_peek_사용시_노드의_data_반환() {
        sut.enqueue(inputData: firstData)
        
        XCTAssertEqual(1, sut.peek())
    }
}
