//
//  NumberFormatError.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/19.
//

enum NumberFormatError: Error {
    case convertedString
    
    var localized: String {
        switch self {
        case .convertedString:
            return "객체가 올바른 클래스가 아니여서 nil을 반환합니다."
        }
    }
}
