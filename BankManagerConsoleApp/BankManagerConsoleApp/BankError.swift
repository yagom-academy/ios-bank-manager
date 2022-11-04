//
//  BankError.swift
//  BankManagerConsoleApp

import Foundation

enum BankError: Error {
    case invalidInput
    case formattingError
    
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return NSLocalizedString("잘못된 입력", comment: "invalid input")
        case .formattingError:
            return NSLocalizedString("포맷팅 실패", comment: "formatting error")
        }
    }
}
