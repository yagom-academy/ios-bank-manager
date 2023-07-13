//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

import Foundation

struct Banker {
    var workingTime: Double = 0.0
    
    // 추후 더 정확하게 함수명 변경 고려하기
    mutating func task() {
        usleep(700_000)
        workingTime += 0.7
    }
    
    func submitWorkingTime() -> Double {
        return workingTime
    }
}
