//
//  BankError.swift
//  BankManagerConsoleApp

enum BankError: Error {
    case invalidInput
    case formattingError
    
    var message: String {
        switch self {
        case .invalidInput:
            return "잘못된 입력"
        case .formattingError:
            return "포맷팅 실패"
        }
    }
}
