//
//  Grade.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/11.
//

import Foundation

enum Grade: CaseIterable {
    case VVIP
    case VIP
    case normal
    
    var gradeString: String {
        switch self {
        case .VVIP:
            return "VVIP"
        case .VIP:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
    
    var gradePriority: Int {
        switch self {
        case .VVIP:
            return 0
        case .VIP:
            return 1
        case .normal:
            return 2
        }
    }
}
