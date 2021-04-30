//
//  BankManagerError.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/29.
//

import Foundation

enum BankManagerError: Error, CustomStringConvertible {
    case invaildMenu(String)
    
    var description: String {
        switch self {
        case .invaildMenu(let functionName):
            return "invaildInput \(functionName)"
        }
    }
}
