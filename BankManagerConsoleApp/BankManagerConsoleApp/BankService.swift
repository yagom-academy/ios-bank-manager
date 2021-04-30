//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/04/30.
//

import Foundation

enum creditRating: CustomStringConvertible {
    case vvip
    case vip
    case normal
    
    var description: String {
        switch self {
        case .vvip:
            return "VVIP"
        case .vip:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
}

enum workType: CustomStringConvertible {
    case deposit
    case loan
    
    var duration: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
}


