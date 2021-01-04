//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

enum BankError: Error {
    case wrongUserInput
    case noEnterFromUser
    case unknown
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongUserInput:
            return "잘못된 입력입니다. 다시 입력해주세요"
        case .noEnterFromUser:
            return "입력이 없습니다. 입력해주세요"
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
}
