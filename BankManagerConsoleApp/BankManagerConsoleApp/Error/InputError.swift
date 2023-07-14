//
//  InputError.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

enum InputError: Error {
    case invalid
    
    var localized: String {
        switch self {
        case .invalid:
            return "잘못된 입력입니다. 다시 한번 입력 해주세요."
        }
    }
}
