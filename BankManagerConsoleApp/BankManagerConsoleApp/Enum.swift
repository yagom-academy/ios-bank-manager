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
    static let closeMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    static let tellerStartMassage = "%d번 창구 : %d번 고객 업무 시작"
    static let tellerFinishMessage = "%d번 창구 : %d번 고객 업무 완료"
    
    static let milliseconds: Double = 1000000
}

enum BusinessType {
    case normal
    
    var neededTime: Double {
        switch self {
        case .normal:
            return 0.7
        }
    }
}

enum BankError: Error {
    case wrongInput
    case unknown
    
    var description: String {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 입력해주세요"
        case .unknown:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
