//
//  InputError.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

enum InputError: Error {
    case invalidInput
    
    var localized: String {
        switch self {
        case .invalidInput:
            return "잘못된 입력입니다."
        }
    }
}
