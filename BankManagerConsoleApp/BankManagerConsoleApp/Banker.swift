//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

import Foundation

struct Banker {
    // 추후 더 정확하게 함수명 변경 고려하기
    mutating func task(_ customer: Customer) {
        guard let queueNumber = customer.queueNumber else {
            return
        }
        
        print("\(queueNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(queueNumber)번 고객 업무 종료")
    }
}
