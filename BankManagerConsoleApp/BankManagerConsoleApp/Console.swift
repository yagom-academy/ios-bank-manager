//  BankManagerConsoleApp - Console.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct Console {
    private let consoleGuideLine: String = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    
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
            
            if consoleFlag == 1 {
                openBank()
                printCompleteMessage()
            } else {
                return
            }
        }
    }
    
    private func printConsoleGuideLine() {
        print(consoleGuideLine, terminator: " ")
    }
    
    private func receivedUserInput() -> Result<Int, ConsoleError> {
        guard let input: String = readLine(),
              let flag: Int = Int(input),
              Array(1...2).contains(flag) == true else {
                  return.failure(.invalidError)
              }
    
        return.success(flag)
    }
    
    private func openBank() {
        var bank: Bank = Bank()
        bank.startBankingService()
    }
    
    private func printCompleteMessage() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 10명이며, 총 업무시간은 7.00초입니다.")
    }
}

enum ConsoleError: LocalizedError {
    case invalidError
    
    public var errorDescription: String? {
        switch self {
        case .invalidError:
            return "잘못된 입력입니다."
        }
    }
}
