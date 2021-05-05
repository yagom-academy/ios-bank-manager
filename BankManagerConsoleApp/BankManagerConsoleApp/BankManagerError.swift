//
//  BankManagerError.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/29.
//

enum BankManagerError: Error {
    case invalidMenu
}

extension BankManagerError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidMenu:
            return "Invalid Input"
        }
    }
}
