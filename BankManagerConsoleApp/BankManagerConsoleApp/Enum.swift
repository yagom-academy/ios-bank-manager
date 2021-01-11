//
//  Print.swift
//  BankManagerConsoleApp
//
//  Created by sole on 2021/01/08.
//

import Foundation

enum WorkingStatus {
    case off
    case enable
    case disable
}

enum BankMessage: String {
    case open = "1 : 은행개점\n2 : 종료\n입력 : "
    case error = "잘못입력하셨습니다. 다시 입력하세요"
}

enum ClerkWork: String  {
    case stratMessage = "%d번 창구 %d번 손님 업무 시작"
    case FinishedMessage = "%d번 창구 %d번 손님 업부 완료"
    case ClosedMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
}
