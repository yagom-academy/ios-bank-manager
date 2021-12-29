//
//  BankWorkType.swift
//  BankManagerConsoleApp
//
//  Created by 권나영 on 2021/12/29.
//

import Foundation

enum BankWork: CaseIterable {
    case deposit
    case loan
    
    var koreanDescription: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
