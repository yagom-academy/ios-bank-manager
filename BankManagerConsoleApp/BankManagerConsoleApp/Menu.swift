//
//  Menu.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/12.
//

enum Menu: String, CaseIterable, CustomStringConvertible {
    case open = "1"
    case finish = "2"

    var description: String {
        switch self {
        case .open:
            return "은행개점"
        case .finish:
            return "종료"
        }
    }
    
    static func displayMenu() {
        Self.allCases.forEach { print("\($0.rawValue) : \($0)") }
    }
}
