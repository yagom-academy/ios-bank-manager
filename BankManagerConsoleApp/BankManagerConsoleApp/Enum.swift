//
//  String.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

enum Menu: String {
    case start = "1"
    case end = "2"
    
    static let description = """
    1: 은행 개점
    2: 종료
    입력 :
    """
}

enum Message: String {
    case close = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    case tellerStart = "%d번 고객 업무 시작"
    case tellerFinish = "%d번 고객 업무 완료"
}

enum BusinessType {
    case normal
    
    var neededTime: TimeInterval {
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
