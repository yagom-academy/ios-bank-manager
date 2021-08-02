//
//  ErrorMessage.swift
//  BankManagerConsoleApp
//
//  Created by YongHoon JJo on 2021/08/02.
//

import Foundation

enum BankManagerErrorMessage: Error {
    case wrongInput
}

extension BankManagerErrorMessage: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력 입니다. 프로그램을 종료합니다."
        }
    }
}
