//
//  BankManager.swift
//  Created by Taeangel, Tiana 2022/04/25.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

fileprivate enum MenuSelect: String {
    case open = "1"
    case close = "2"
}

fileprivate enum Guide: String {
    case menu = """
    1 : 은행 개점
    2 : 종료
    """
    case input = "입력: "
    case error = "잘못 눌렀습니다."
    
    static func closeDescription(totalDuration: Double, clientCount: Int) {
        print("""
              업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, \
              총 업무시간은 \(totalDuration.formatSecondDecimal)초입니다.
              """)
    }
}

struct BankManager {
    private var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
    
    mutating func start() {
        printBankDescription()
        guard let input = readLine() else {
            return
        }
        switch input {
        case MenuSelect.open.rawValue:
            manageBank()
            start()
        case MenuSelect.close.rawValue:
            return
        default:
            restart()
        }
    }
    
    private func printBankDescription() {
        print(Guide.menu.rawValue)
        print(Guide.input.rawValue, terminator: String.empty)
    }
    
    private func manageBank() {
        guard let totalCount = bank.giveWaitingNumber() else {
            return
        }
        
        let startTime = CFAbsoluteTimeGetCurrent()
        bank.open()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        closeBank(totalDuration: durationTime, clientCount: totalCount)
    }
    
    private mutating func restart() {
        print(Guide.error.rawValue)
        start()
    }
    
    private func closeBank(totalDuration: Double, clientCount: Int) {
        Guide.closeDescription(totalDuration: totalDuration, clientCount: clientCount)
    }

}
