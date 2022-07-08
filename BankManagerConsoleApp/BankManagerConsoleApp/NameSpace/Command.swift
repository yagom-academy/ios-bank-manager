//
//  BankNameSpace.swift
//  BankManagerConsoleApp
//
//  Created by dhoney96 on 2022/07/01.
//
enum Command: CustomStringConvertible {
    case open
    case close
    
    var description: String {
        switch self {
        case .open:
            return "1"
        case .close:
            return "2"
        }
    }
}
