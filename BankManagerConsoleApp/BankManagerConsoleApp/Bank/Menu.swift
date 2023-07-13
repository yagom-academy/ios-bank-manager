//
//  Menu.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/12.
//

enum Menu: String, CaseIterable {
    case open = "은행개점"
    case finish = "종료"

    var menuNumber: String {
        switch self {
        case .open:
            return "1"
        case .finish:
            return "2"
        }
    }
    
    static func displayMenu() {
        Self.allCases.forEach { print("\($0.menuNumber) : \($0.rawValue)") }
    }
}
