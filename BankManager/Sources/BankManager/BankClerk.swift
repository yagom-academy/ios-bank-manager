//
//  BankClerk.swift
//
//
//  Created by Kiseok on 11/16/23.
//

import Foundation



public struct BankClerk {
    
    public init() { }
    
    public func startTask(count: Int) {
        print("\(count)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(count)번 고객 업무 완료")
    }
    
    public func endTask(customerNumber: Double) {
        print("업무가 마감 되었습니다. 오늘 업무를 처리한 고객은 총 \(Int(customerNumber))명이며, 총 업무시간은 \(String(format: "%.2f", customerNumber * 0.7))초입니다.")
    }
}
