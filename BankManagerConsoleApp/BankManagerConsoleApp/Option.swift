//
//  Option.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/07/01.
//

enum Option {
    case open
    case close
}

extension Option: CustomStringConvertible {
    var description: String {
        switch self {
        case .open:
            return "1"
        case .close:
            return "2"
        }
    }
}
