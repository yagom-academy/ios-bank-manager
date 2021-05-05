//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/05/05.
//

import Foundation

enum BankError: Error {
    case invalidClientPriority
    case invalidTask
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidTask:
            return "잘못된 업무입니다🚨"
        case .invalidClientPriority:
            return "잘못된 고객 등급입니다🚨"
        }
    }
}
