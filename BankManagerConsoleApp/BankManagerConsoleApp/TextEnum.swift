//
//  TextEnum.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

import Foundation

enum MenuMessage {
    static let bankOpen: String = "은행 개점"
    static let bankClose: String = "종료"
    static let inputErrorMessage: String = "입력이 잘못 되었습니다."
    static let input: String = "입력 : "
}

enum BankingMessage {
    static let depositStartMessage: String = "번 고객 예금업무 시작"
    static let depositEndingMessage: String = "번 고객 예금업무 종료"
    static let loanStartMessage: String = "번 고객 대출업무 시작"
    static let loanEndingMessage: String = "번 고객 대출업무 종료"
}
