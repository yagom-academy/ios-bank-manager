//
//  Message.swift
//  BankManagerConsoleApp
//
//  Created by 리나 on 2021/01/12.
//

import Foundation

enum Message {
    static let close = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    static let tellerStart = "%d번 %@고객 %@업무 시작"
    static let tellerFinish = "%d번 %@고객 %@업무 완료"
    static let loanStart = "%d번 %@고객 %@심사 시작"
    static let loanFinish = "%d번 %@고객 %@심사 완료"
}
