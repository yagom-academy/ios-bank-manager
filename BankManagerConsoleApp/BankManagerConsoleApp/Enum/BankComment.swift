//
//  BankComment.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/07/05.
//

enum BankManagerComment: String {
    case workInit = "번 고객 "
    case workStart = "업무 시작"
    case workFinish = "업무 완료"
}

enum BankComment: String {
    case greeting = "1 : 은행개점 \n2 : 종료"
    case secondGreeting = "입력 : "
    case wrongInputGreeting = "잘못된 입력입니다 보여지는 메뉴중에서 선택해주세요."
    case failChange = "변환에 실패했습니다."
    case emptyValue = ""
    case bankOpen = "1"
    case bankClose = "2"
}
