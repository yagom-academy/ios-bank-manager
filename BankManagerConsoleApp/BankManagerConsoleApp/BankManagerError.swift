//
//  BankManagerError.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/29.
//

import Foundation

enum BankManagerError: Error, CustomStringConvertible {
    case invalidMenu(String)
    
    var description: String {
        switch self {
        case .invalidMenu(let functionName):
            return "invalidInput. Method Name: \(functionName)"
        }
    }
}
