//
//  BankMessage.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/30.
//

import Foundation

enum BankMessage {
    static let showSelectMessage = """
        1: 은행개점
        2: 종료
        입력:
        """
   static func workingMessage(numberTicket: Int,
                              type: BusinessType,
                              isStartWork: Bool) -> String {
        return isStartWork == true ? "\(numberTicket)번 고객 \(type)업무 시작" : "\(numberTicket)번 고객 \(type)업무 완료"
    }
}
