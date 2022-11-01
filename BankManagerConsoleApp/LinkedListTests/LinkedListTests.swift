//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Ayaan on 2022/11/01.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList = LinkedList<Int>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }
    
    func test_정수_10을_append한_경우_LinkedList의_first는_10과_같다() {
        //given
        let data: Int = 10
        
        //when
        sut.append(data)
        
        //then
        XCTAssertEqual(sut.first, 10)
    }
    
    func test_정수_10과_20을_append한_경우_LinkedList의_first는_10과_같고_last는_20과_같다() {
        //given
        let firstData: Int = 10
        let lastData: Int = 20
        
        //when
        sut.append(firstData)
        sut.append(lastData)
        
        //then
        XCTAssertEqual(sut.first, 10)
        XCTAssertEqual(sut.last, 20)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append한_경우_LinkedList의_first는_배열의_첫번째_값과_같고_last는_배열의_마지막_값과_같다() {
        //given
        let data: [Int] = Array(1...10)
        
        //when
        data.forEach {
            sut.append($0)
        }
        
        //then
        XCTAssertEqual(sut.first, data.first)
        XCTAssertEqual(sut.last, data.last)
    }
    
    func test_빈_LinkedList를_removeFirst한_경우_결과는_Nil이다() {
        //given
        
        //when
        let result: Int? = sut.removeFirst()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_정수_10과_20을_append한_후_removeFirst한_경우_결과는_10과_같다() {
        //given
        sut.append(10)
        sut.append(20)
        
        //when
        let result: Int? = sut.removeFirst()
        
        //then
        XCTAssertEqual(result, 10)
    }
    
    func test_빈_LinkedList를_removeLast한_경우_결과는_Nil이다() {
        //given
        
        //when
        let result: Int? = sut.removeLast()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_정수_10과_20을_append한_후_removeLast한_경우_결과는_20과_같다() {
        //given
        sut.append(10)
        sut.append(20)
        
        //when
        let result: Int? = sut.removeLast()
        
        //then
        XCTAssertEqual(result, 20)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_정수_11로_searchFirstNode한_경우_결과는_nil이다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let result: Node<Int>? = sut.searchFirstNode(from: 11)
        
        //then
        XCTAssertNil(result)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_정수_5를_searchFirstNode한_경우_결과값의_data는_5와_같다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let result: Node<Int>? = sut.searchFirstNode(from: 5)
        
        //then
        XCTAssertEqual(result?.data, 5)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_20번째를_searchNode한_경우_결과는_nil이다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let result: Node<Int>? = sut.searchNode(at: 20)
        
        //then
        XCTAssertNil(result)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_7번째를_searchNode한_경우_결과값의_data는_7과_같다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let result: Node<Int>? = sut.searchNode(at: 7)
        
        //then
        XCTAssertEqual(result?.data, 7)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_100번째를_remove한_경우_결과값은_Nil이다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let result: Int? = sut.remove(at: 100)
        
        
        //then
        XCTAssertNil(result)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_3번째를_remove한_경우_결과값은_3과_같다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let result: Int? = sut.remove(at: 3)
        
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_3번째를_remove한_후_3번째를_searchNode한_경우_결과값은_4와_같다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        let _: Int? = sut.remove(at: 3)
        let result: Node<Int>? = sut.searchNode(at: 3)
        
        
        //then
        XCTAssertEqual(result?.data, 4)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_20번째에_정수20를_insert한_후_11번째와_20번째를_searchNode한_경우_두_결과값은_모두_nil이다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        sut.insert(at: 20, data: 11)
        let firstResult: Node<Int>? = sut.searchNode(at: 11)
        let secondResult: Node<Int>? = sut.searchNode(at: 20)
        
        //then
        XCTAssertNil(firstResult)
        XCTAssertNil(secondResult)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList에_6번째에_정수60를_insert한_후_6번째를_searchNode한_경우_결과값의_data는_60과_같다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        sut.insert(at: 6, data: 60)
        let result: Node<Int>? = sut.searchNode(at: 6)
        
        //then
        XCTAssertEqual(result?.data, 60)
    }
    
    func test_1부터_10까지의_정수로_이루어진_배열을_차례대로_append된_LinkedList를_removeAll한_경우_LinkedList의_isEmpty가_true이다() {
        //given
        let data: [Int] = Array(1...10)
        
        data.forEach {
            sut.append($0)
        }
        
        //when
        sut.removeAll()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}

