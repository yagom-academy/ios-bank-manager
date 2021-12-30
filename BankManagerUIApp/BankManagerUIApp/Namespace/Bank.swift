//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation
import CloudKit

enum Bank {
    
    enum Task: CaseIterable {
        case deposit
        case loan
        
        static let depositSemaphore = DispatchSemaphore(value: Bank.depositClerkCount)
        static let loanSemaphore = DispatchSemaphore(value: Bank.loanClerkCount)
        
        var koreanName: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
        var timeNeeded: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
        var semaphore: DispatchSemaphore {
            switch self {
            case .deposit:
                return Bank.Task.depositSemaphore
            case .loan:
                return Bank.Task.loanSemaphore
            }
        }
    }
    
    static let depositClerkCount = 2
    static let loanClerkCount = 1
    static let totalClerkCount = depositClerkCount + loanClerkCount
    
    static func printClosingMessage(totalClientCount: Int, totalWorkingTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClientCount)명이며, 총 업무시간은 \(totalWorkingTime)초입니다.")
    }
}
