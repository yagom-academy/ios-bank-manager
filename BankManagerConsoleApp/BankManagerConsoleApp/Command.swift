//
//  BankNameSpace.swift
//  BankManagerConsoleApp
//
//  Created by dhoney96 on 2022/07/01.
//
enum Command: CustomStringConvertible {
    case open
    case close
    case loan
    case deposit
    
    var description: String {
        switch self {
        case .open:
            return "1"
        case .close:
            return "2"
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
