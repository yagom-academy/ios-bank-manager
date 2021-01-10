//
//  BankerMessage.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/08.
//

import Foundation

struct BankerMessage {
    enum TaskStates: String {
        case start = " 업무 시작"
        case completion = " 업무 완료"
    }
    
    static func printTaskText(customer: Int, customerClass: String, customerTask: String, state: TaskStates) {
        switch state {
        case .start:
            print("\(customer)번 " + customerClass + customerTask + state.rawValue)
        case .completion:
            print("\(customer)번 " + customerClass + customerTask + state.rawValue)
        }
    }
    
    static func printCloseBankText(customers: Int, taskedTime: Double) {
        print(("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(String.init(format: "%.2f", Double(taskedTime) / 1000000))초 입니다."))
    }
}
