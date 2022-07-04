//
//  BankManagerNameSpace.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

enum BusinessType: Double {
    case work = 0.7
}

enum SetNumber: Int {
    case decimalRange = 2
    case minimumCustomerCount = 1
    case failNumberFormatter = 0
    case minCustomer = 10
    case maxCustomer = 30
}

enum BankManagerComment: String {
    case handleBankingStart = "번 고객 업무 시작"
    case handleBankingFinish = "번 고객 업무 완료"
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

enum NoneValueError: Error {
    case noneValue
}
