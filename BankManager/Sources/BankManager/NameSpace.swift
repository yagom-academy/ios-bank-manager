//
//  NameSpace.swift
//
//
//  Created by Hisop on 2023/11/22.
//
enum WorkReport {
    static func startWork(customer: Customer) {
        print("\(customer.number)번 고객 \(customer.business.rawValue)업무 시작")
    }
    
    static func endWork(customer: Customer) {
        print("\(customer.number)번 고객 \(customer.business.rawValue)업무 완료")
    }
    
    static func endWorkString(customerCount: Int, workTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))초입니다.")
    }
}
