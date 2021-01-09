//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

struct Customer {
    enum CustomerClass: Int {
        case VVIP = 0
        case VIP = 1
        case normal = 2
    }
    
    enum CustomerClassMessage: String {
        case VVIP = "VVIP"
        case VIP = "VIP"
        case normal = "일반"
    }
}
