//
//  BankFunction.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/07.
//

import Foundation

struct BankFunction {
    static func provideOption() {
        print("1 : 은행개점")
        print("2 : 종료")
    }
    
    static func informResult(_ start: Double, _ end: Double, _ totalNumberOfCustomers: Int) {
        let totalWorkTime = String(format: "%.2f", end - start)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfCustomers)명이며, 총 업무시간은 \(totalWorkTime)초 입니다.")
    }
    
}
