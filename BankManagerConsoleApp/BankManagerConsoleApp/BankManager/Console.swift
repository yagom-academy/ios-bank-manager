//
//  ConsoleMessage.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

enum Console {
    
    enum Input: String {
        case open = "1"
        case exit = "2"
    }
    
    enum Message: String {
        case invalidInput = "입력이 잘못되었습니다. 다시 입력해주세요."
        case menu = "1 : 은행개점\n2 : 종료\n입력 : "
        
        static func beginService(of clientNumber: Int) -> String {
            return "\(clientNumber)번 고객 업무 시작"
        }
        
        static func endService(of clientNumber: Int) -> String {
            return "\(clientNumber)번 고객 업무 완료"
        }
        
        static func closeBank(_ totalClient: Int, _ duration: String) -> String {
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClient)명이며, 총 업무시간은 \(duration)초입니다."
        }
    }
}
