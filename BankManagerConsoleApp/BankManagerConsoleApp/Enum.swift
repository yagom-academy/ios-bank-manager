//
//  String.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

enum BankMenu: String {
    case start = "1"
    case end = "2"
    
    static let description = "1: 은행 개점\n2: 종료\n입력 : "
}

enum Bank {
    static let closeMessageFront = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 "
    static let closeMessageMiddle = "명이며, 총 업무시간은 "
    static let closeMessageEnd = "초입니다."
    
    static let tellerCommentMiddle = "번 창구 : "
    static let tellerCommentStart = "번 고객 업무 시작"
    static let tellerCommentEnd = "번 고객 업무 완료"
     
    static let milliseconds: Double = 1000000
}
