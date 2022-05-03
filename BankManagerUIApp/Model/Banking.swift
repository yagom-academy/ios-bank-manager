//
//  Banking.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/05/03.
//

enum Banking: CaseIterable {
    case deposit
    case loan
}

extension Banking {
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }

    var processTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
