//
//  BankManagerError.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/29.
//

enum BankManagerError: Error, CustomStringConvertible {
    case invalidMenu(String)
    
    var description: String {
        switch self {
        case .invalidMenu(let userInput):
            return "Invalid Input. User Input: \(userInput)"
        }
    }
}
