//
//  Message.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

enum StarterMessage: String, CustomStringConvertible {
    case open = "1 : 은행 개점\n2 : 종료\n입력 : "
    case close = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 ?? 명 이며, 총 업무 시간은 ?? 초 입니다"
    case wrongInput = "잘못된 입력입니다. 다시 입력해주세요."
    
    var description: String {
        self.rawValue
    }
}
