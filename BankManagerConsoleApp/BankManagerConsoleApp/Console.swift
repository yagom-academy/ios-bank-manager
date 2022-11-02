//  BankManagerConsoleApp - Console.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct Console {
    typealias WorkResult = (customerCount: Int, time: Double)
    private let openingFlag: Int = 1
    private let closingFlag: Int = 2
    
    func start() {
        while true {
            printConsoleGuideLine()
            
            let result: Result<Int, ConsoleError> = receivedUserInput()
            let consoleFlag: Int
            
            switch result {
            case .success(let flag):
                consoleFlag = flag
            case .failure(let error):
                print(error.localizedDescription)
                continue
            }
            
            if consoleFlag == openingFlag {
                let workReslt: WorkResult = openBank()
                
                printCompleteMessage(about: workReslt)
            } else if consoleFlag == closingFlag {
                return
            }
        }
    }
    
    private func printConsoleGuideLine() {
        let consoleGuideLine: String = """
        1 : 은행개점
        2 : 종료
        입력 :
        """
        
        print(consoleGuideLine, terminator: " ")
    }
    
    private func receivedUserInput() -> Result<Int, ConsoleError> {
        guard let input: String = readLine(),
              let flag: Int = Int(input),
              Array(openingFlag, closingFlag).contains(flag) == true else {
                  return.failure(.invalidError)
              }
    
        return.success(flag)
    }
    
    private func openBank() -> WorkResult {
        var bank: Bank = Bank()
        
        bank.startBankingService()
        
        return bank.workResult
    }
    
    private func printCompleteMessage(about workResult: WorkResult) {
        let timeText: String = String(format: "%.2f", workResult.time)
        let completeMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(workResult.customerCount)명이며, 총 업무시간은 \(timeText)초입니다."
        
        print(completeMessage)
    }
}

enum ConsoleError: LocalizedError {
    case invalidError
    
    public var errorDescription: String? {
        switch self {
        case .invalidError:
            let errorMessage: String = "잘못된 입력입니다."
            
            return errorMessage
        }
    }
}
