//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Yongwoo Marco on 2021/07/27.
//

@testable import BankManagerConsoleApp
import XCTest

class BankManagerConsoleAppTests: XCTestCase {
    var sut = LinkedList<Int>()
 
    func test_sut에서_peekFirst을_실패한다() {
        // given
        
        // when
        let result = sut.peekFirst()
        // then
        XCTAssertEqual(nil, result)
    }
    
    func test_sut에서_peekFirst을_성공한다() {
        // given
        let firstNumber = 1
        sut.append(1)
        // when
        let test = sut.peekFirst()
        // then
        XCTAssertEqual(firstNumber, test)
    }
    
    func test_sut에서_clear을_실패한다() {
        // given
        var testArr = [
            Pointer(value: 1, weakPointer: nil),
            Pointer(value: 2, weakPointer: nil),
            Pointer(value: 3, weakPointer: nil),
            Pointer(value: 4, weakPointer: nil)
        ]
        testArr.enumerated().forEach({ value in
            sut.append(value.element.value)
            testArr[value.offset].weakPointer = sut.peekLastNode()
        })
        
        // when
        sut.clear()
        let result = testArr.filter({ $0.weakPointer != nil }).count
                
        // then
        XCTAssertNotEqual(result, 4)
    }

    func test_sut에서_clear을_성공한다() {
        // given
        var testArr = [
            Pointer(value: 1, weakPointer: nil),
            Pointer(value: 2, weakPointer: nil),
            Pointer(value: 3, weakPointer: nil),
            Pointer(value: 4, weakPointer: nil)
        ]
        testArr.enumerated().forEach({ value in
            sut.append(value.element.value)
            testArr[value.offset].weakPointer = sut.peekLastNode()
        })
        
        // when
        sut.clear()
        let result = testArr.filter({ $0.weakPointer != nil }).count
                
        // then
        XCTAssertEqual(result, 0)
    }
}

struct Pointer {
    let value: Int
    weak var weakPointer: Node<Int>?
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return true
    }
}

