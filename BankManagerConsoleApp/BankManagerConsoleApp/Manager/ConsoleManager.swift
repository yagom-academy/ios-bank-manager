//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

struct ConsoleManager {
    private var bankManager: BankManager
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    mutating func startConsole() {
        showMenu()
        doAct(userInput: validateUserInput())
    }
    
    private func showMenu() {
        print("""
        1 : 은행개점
        2 : 종료
        입력 :
        """, terminator: " ")
    }
    
    private func inputUserSelect() -> Int? {
        guard let input = readLine() else { return nil }
        return Int(input)
    }
    
    private func validateUserInput() -> Int {
        guard let filteredInput = inputUserSelect() else { return 0 }
        return filteredInput
    }
    
    private mutating func doAct(userInput: Int) {
        switch userInput {
        case 1:
            bankManager.openBank()
            let reportedData = bankManager.startBankWork()
            showReportedData(data: reportedData)
            bankManager.closeBank()
            startConsole()
        case 2:
            return
        default:
            print("잘못된 입력입니다.")
            startConsole()
        }
    }
    
    private func showReportedData(data: ReportData) {
        let reportTime = data.duringTime.convertedNumberToTime
        let reportUserCount = data.customerCount
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(reportUserCount)명 이며,", terminator: " ")
        print("총 업무시간은 \(reportTime) 입니다.")
    }
}

private extension TimeInterval {
    static let hundred: Self = 100.0
    var convertedNumberToTime: Double {
        return (self * Self.hundred).rounded() / Self.hundred
    }
}
