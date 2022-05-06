//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/05/04.
//

import UIKit

enum TaskType: CaseIterable {
    case deposit
    case loan

    var text: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }

    var spendingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var color: UIColor {
        switch self {
        case .deposit:
            return .black
        case .loan:
            return .purple
        }
    }
}
