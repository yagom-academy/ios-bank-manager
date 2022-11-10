//
//  NameSpace.swift
//  BankManagerConsoleApp
//
//  Created by junho,woong on 2022/11/10.
//

enum NameSpace {
    static let blank: String = ""
    static let input: String = "입력 : "
    static let wrongInput: String = "다시 입력하세요."
    static let totalTimeFormat: String = "%.2f"
    static let customerCountRange: ClosedRange<Int> = 10...30
    static let depositBankerCount: Int = 2
    static let loanBankerCount: Int = 1
    
    static func processingClosedMessage(totalCustomerCount: Int, totalTime: String) -> String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(totalTime)초입니다."
    }
    
    static func processingStartMessage(customerNumber: Int, bankBusinessDescription: String) -> String {
        return "\(customerNumber)번 고객 \(bankBusinessDescription)업무 시작"
    }
    
    static func processingFinishMessage(customerNumber: Int, bankBusinessDescription: String) -> String {
        return "\(customerNumber)번 고객 \(bankBusinessDescription)업무 완료"
    }

    static func menuInfo(menuNumber: Int, menuDescription: String) -> String {
        return "\(menuNumber) : \(menuDescription)"
    }
}
