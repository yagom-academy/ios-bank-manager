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
    case mismatchNumber
    case emptyBank
    case invalidateTime
    case invalidateBanker
    case invalidateCustomer
    case unknown
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .input:
            return "입력을 받지 못했습니다.\n다시 시도해 주세요."
        case .number:
            return "숫자를 입력해주세요."
        case .mismatchNumber:
            return "알맞은 숫자를 입력해주세요."
        case .emptyBank:
            return "은행이 없습니다.\n다시 시도해 주세요."
        case .invalidateTime:
            return "시간이 없습니다.\n다시 시도해 주세요."
        case .invalidateBanker:
            return "은행원이 없는 창구입니다.\n다시 시도해 주세요."
        case .invalidateCustomer:
            return "배정된 고객이 없는 창구입니다.\n다시 시도해 주세요."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다.\n다시 시도해 주세요."
        }
    }
}
