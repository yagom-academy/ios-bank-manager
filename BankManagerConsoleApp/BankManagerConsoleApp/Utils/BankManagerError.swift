//
//  ErrorMessage.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/08/02.
//

import Foundation

enum BankManagerError: Error {
    case wrongInput
    case unknown
}

extension BankManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력 입니다. 프로그램을 종료합니다."
        case .unknown:
            return "알수 없는 오류 입니다. 프로그램을 종료합니다."
        }
    }
}
