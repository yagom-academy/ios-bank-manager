//
//  BankMessage.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/30.
//

import Foundation

enum BankMessage {
    static let startWork = "번 고객 업무 시작"
    static let finishWork = "번 고객 업무 완료"
    static let openBank = "1: 은행개점"
    static let closedBank = "2: 종료"
    
    static func bankClosed(customers: Int) -> String {
        let totalWorkTime = 0.7 * Double(customers)
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(totalWorkTime)초 입니다."
    }
    
}
