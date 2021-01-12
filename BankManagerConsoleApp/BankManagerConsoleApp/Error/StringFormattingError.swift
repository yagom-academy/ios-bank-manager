//
//  StringFormattingError.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

enum StringFormattingError: Error {
    case wrongUserInput
    case noEnterFromUser
    case unknown
    case noMatchingType
}

extension StringFormattingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongUserInput:
            return "잘못된 입력입니다. 다시 입력해주세요"
        case .noEnterFromUser:
            return "입력이 없습니다. 입력해주세요"
        case .noMatchingType:
            return "해당 타입과 매칭되는 타입이 없습니다."
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
}
