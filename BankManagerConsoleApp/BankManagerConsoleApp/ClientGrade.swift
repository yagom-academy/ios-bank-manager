//
//  ClientGrade.swift
//  BankManagerConsoleApp
//
//  Created by 강인희 on 2021/01/07.
//

import Foundation

//enum ClientGrade: String, CaseIterable {
//    case VVIP
//    case VIP
//    case normal = "일반"
//}
enum ClientGrade: Int, CaseIterable {
    case VVIP = 0
    case VIP
    case normal
    
    var description: String {
        switch self {
        case .VVIP:
            return "VVIP"
        case .VIP:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
}
