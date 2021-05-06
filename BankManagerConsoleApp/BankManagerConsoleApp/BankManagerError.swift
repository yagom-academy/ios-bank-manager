//
//  BankManagerError.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/29.
//

enum BankManagerError: Error, Equatable {
    case invalidMenu
    case ownerNotAssigned
}

extension BankManagerError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidMenu:
            return "Invalid Input"
        case .ownerNotAssigned:
            return "Owner is not assigned yet."
        }
    }
}
