//
//  ConsoleAppMenu.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

enum ConsoleAppMenu: Int, CaseIterable {
    case startBank = 1
    case quit = 2
    
    var description: String {
        switch self {
        case .startBank:
            return "은행개점"
        case .quit:
            return "종료"
        }
    }
}
