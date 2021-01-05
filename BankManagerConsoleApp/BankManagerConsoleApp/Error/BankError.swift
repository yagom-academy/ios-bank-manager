//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

enum BankError: Error {
    case input
    case number
    case unknow
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .input:
            return "입력을 받지 못했습니다.\n다시 시도해 주세요."
        case .number:
            return "숫자를 입력해주세요."
        case .unknow:
            return "알 수 없는 오류가 발생했습니다.\n다시 시도해 주세요."
        }
    }
}
