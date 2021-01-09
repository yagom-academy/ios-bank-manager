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
    
    func setCustomerClass() -> Int {
        let customerClass = Int.random(in: 0...2)
        switch customerClass {
        case CustomerClass.VVIP.rawValue:
            return CustomerClass.VVIP.rawValue
        case CustomerClass.VIP.rawValue:
            return CustomerClass.VIP.rawValue
        default:
            return CustomerClass.normal.rawValue
        }
    }
}

