//
//  BankManagerError.swift
//  BankManagerConsoleApp
//
//  Created by Sunwoo on 2021/12/27.
//

import Foundation

enum BankManagerError: LocalizedError {
    case invalidUserInput
}

extension BankManagerError {
    var description: String {
        switch self {
        case .invalidUserInput:
            return "잘못된 입력입니다."
        }
    }
}
