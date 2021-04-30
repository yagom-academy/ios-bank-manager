//
//  Data.swift
//  BankManagerConsoleApp
//
//  Created by 김민성 on 2021/04/29.
//

import Foundation

enum SelectMenu: String {
    case start = "1"
    case end = "2"
}

enum Messages: String {
    case unknownInputMessage = "잘못된 입력입니다.다시 입력해주세요"
    case initialChoiceMessage = "1 : 은행 개점 \n2 : 종료"
}
