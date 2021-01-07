//
//  MessageCollection.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/07.
//

struct MessageCollection {
    static let initializationText = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    static let inputErrorText = "올바른 입력을 부탁드립니다. 개점은 숫자 1을, 종료는 숫자 2를 입력해주세요!"
    static func printCloseBankText(customers: Int, taskedTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(Double(taskedTime) / 1000000)초 입니다.")
    }
    static func printTaskCompletionText(customer: Int) {
        print("\(customer)번 고객 업무 완료")
    }
    static func printTaskStartText(customer: Int) {
        print("\(customer)번 고객 업무 시작")
    }
}


