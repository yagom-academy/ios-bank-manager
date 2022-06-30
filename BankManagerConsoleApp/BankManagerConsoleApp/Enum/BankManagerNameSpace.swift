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
}

enum BankManagerComment: String {
    case handleBankingStart = "번 고객 업무 시작"
    case handleBankingFinish = "번 고객 업무 완료"
}

enum BankComent: String {
case greeting = "1 : 은행개점 \n2 : 종료"
case secondGreeting = "입력 : "
case emptyValue = ""
case bankOpen = "1"
case bankClose = "2"
}
