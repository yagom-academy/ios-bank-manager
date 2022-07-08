//
//  NameSpace.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

enum WaitingNumber {
    static let randomCustomerNumberRange = 10...30
}

enum BankTask {
    static let closeBank = "업무가 마감되었습니다. "
    static let processedCustomerTotalNumber = "오늘 업무를 처리한 고객은 총 "
    static let totalWorkTime = "명이며, 총 업무시간은 "
    static let finishOutput = "입니다."
}

enum BankerTask {
    static let bankerTaksStart = "업무 시작"
    static let bankerTaskFinished = "업무 종료"
    static let bankerCurrentCustomerID =  "번 고객 "
}

enum ConsoleTask {
    static let consoleAppStartOutput = """
                1 : 은행개점
                2 : 종료
                입력 : 
                """
    static let open = "1"
    static let close = "2"
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요🥲"
}
