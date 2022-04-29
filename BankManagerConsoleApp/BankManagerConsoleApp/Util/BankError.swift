//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 27/04/2022.
//
import Foundation

enum BankError: LocalizedError {
    case wrongInput
}

extension BankError {
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다"
        }
    }
}
