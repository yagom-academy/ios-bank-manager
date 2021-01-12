//
//  BankStringCollection.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

enum ConsoleApp {
    static let start = "1"
    static let exit = "2"
    static let menu = "1 : 은행 개점 \n2 : 종료"
}

enum BankMessage {
    static let close = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.1f초입니다."
}

enum BankManangerMessage {
    static let start = "%@번 %@고객 %@업무 시작"
    static let end = "%@번 %@고객 %@업무 완료"
}

enum BankManagerState {
    case working
    case notWorking
}

enum CustomerPriority: String, CaseIterable {
    case VVIP = "0"
    case VIP = "1"
    case normal = "2"
    
    var description: String {
        switch self {
        case .VVIP:
            return "VVIP"
        case .VIP:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
}

enum CustomerTask: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var timeForTask: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
