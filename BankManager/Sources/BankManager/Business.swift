//
//  Business.swift
//
//
//  Created by Hisop on 2023/11/22.
//

import Foundation

enum Business: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    var workTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
